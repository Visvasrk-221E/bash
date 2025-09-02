#!/bin/bash

# Discord Blog Webhook GUI Script
# Author: Created for blog post notifications
# Requirements: yad, curl

# Configuration
SCRIPT_NAME="Discord Blog Webhook"
SCRIPT_VERSION="1.0"
CONFIG_FILE="$HOME/.discord-blog-config"
ICON="dialog-information"

# Colors for Discord embeds
COLOR_SUCCESS="5763719"  # Green
COLOR_INFO="3447003"     # Blue
COLOR_WARNING="15105570" # Orange
COLOR_ERROR="15158332"   # Red

# Function to show error dialog
show_error() {
    yad --error --title="Error" --text="$1" --width=400 --height=150 --center
}

# Function to show success dialog
show_success() {
    yad --info --title="Success" --text="$1" --width=400 --height=150 --center
}

# Function to validate URL
validate_url() {
    local url="$1"
    if [[ $url =~ ^https://discord(app)?\.com/api/webhooks/[0-9]+/[A-Za-z0-9_-]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to load configuration
load_config() {
    if [[ -f "$CONFIG_FILE" ]]; then
        source "$CONFIG_FILE"
    fi
}

# Function to save configuration
save_config() {
    cat > "$CONFIG_FILE" << EOF
# Discord Blog Webhook Configuration
WEBHOOK_URL="$1"
AUTHOR_NAME="$2"
AUTHOR_AVATAR="$3"
BOT_USERNAME="$4"
EOF
    chmod 600 "$CONFIG_FILE"
}

# Function to send Discord webhook
send_discord_webhook() {
    local webhook_url="$1"
    local title="$2"
    local description="$3"
    local url="$4"
    local author_name="$5"
    local author_avatar="$6"
    local thumbnail="$7"
    local color="$8"
    local bot_username="$9"
    local bot_avatar="${10}"
    local footer_text="${11}"
    
    # Create JSON payload
    local json_payload
    json_payload=$(cat << EOF
{
    "username": "${bot_username:-Blog Notifier}",
    "avatar_url": "${bot_avatar}",
    "embeds": [
        {
            "title": "$title",
            "description": "$description",
            "url": "$url",
            "color": ${color:-$COLOR_INFO},
            "author": {
                "name": "${author_name:-Blog Author}",
                "icon_url": "$author_avatar"
            },
            "thumbnail": {
                "url": "$thumbnail"
            },
            "footer": {
                "text": "${footer_text:-Posted via Discord Blog Webhook}"
            },
            "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%S.000Z)"
        }
    ]
}
EOF
    )
    
    # Send webhook
    local response
    response=$(curl -s -w "\n%{http_code}" -X POST \
        -H "Content-Type: application/json" \
        -d "$json_payload" \
        "$webhook_url")
    
    local http_code=$(echo "$response" | tail -n1)
    local response_body=$(echo "$response" | head -n-1)
    
    if [[ "$http_code" == "204" ]]; then
        return 0
    else
        echo "HTTP $http_code: $response_body"
        return 1
    fi
}

# Function to show settings dialog
show_settings() {
    load_config
    
    local result
    result=$(yad --form --title="Settings - $SCRIPT_NAME" \
        --text="Configure Discord webhook settings:" \
        --field="Discord Webhook URL:" "${WEBHOOK_URL:-}" \
        --field="Default Author Name:" "${AUTHOR_NAME:-}" \
        --field="Default Author Avatar URL:" "${AUTHOR_AVATAR:-}" \
        --field="Bot Username:" "${BOT_USERNAME:-Blog Notifier}" \
        --width=600 --height=300 --center \
        --button="Save:0" --button="Cancel:1")
    
    if [[ $? -eq 0 ]]; then
        IFS='|' read -r webhook_url author_name author_avatar bot_username <<< "$result"
        
        if validate_url "$webhook_url"; then
            save_config "$webhook_url" "$author_name" "$author_avatar" "$bot_username"
            show_success "Settings saved successfully!"
        else
            show_error "Invalid Discord webhook URL format!"
        fi
    fi
}

# Function to show main dialog
show_main_dialog() {
    load_config
    
    if [[ -z "$WEBHOOK_URL" ]]; then
        yad --question --title="First Time Setup" \
            --text="No webhook URL configured. Would you like to configure settings now?" \
            --width=400 --height=150 --center
        
        if [[ $? -eq 0 ]]; then
            show_settings
            load_config
        fi
        
        if [[ -z "$WEBHOOK_URL" ]]; then
            show_error "No webhook URL configured. Please configure settings first."
            exit 1
        fi
    fi
    
    # Color options for dropdown
    local color_options="Info (Blue)!$COLOR_INFO|Success (Green)!$COLOR_SUCCESS|Warning (Orange)!$COLOR_WARNING|Error (Red)!$COLOR_ERROR"
    
    local result
    result=$(yad --form --title="$SCRIPT_NAME v$SCRIPT_VERSION" \
        --text="Send blog notification to Discord:" \
        --field="Blog Post Title:" "" \
        --field="Description:TXT" "" \
        --field="Blog Post URL:" "" \
        --field="Author Name:" "${AUTHOR_NAME:-}" \
        --field="Author Avatar URL:" "${AUTHOR_AVATAR:-}" \
        --field="Thumbnail Image URL:" "" \
        --field="Embed Color:CB" "$color_options" \
        --field="Footer Text:" "New blog post published!" \
        --width=700 --height=500 --center \
        --button="Send:0" --button="Settings:2" --button="Cancel:1")
    
    local exit_code=$?
    
    case $exit_code in
        0)  # Send button
            IFS='|' read -r title description url author_name author_avatar thumbnail color_selection footer_text <<< "$result"
            
            # Extract color value from selection
            local color_value
            color_value=$(echo "$color_selection" | cut -d'!' -f2)
            
            # Validate required fields
            if [[ -z "$title" ]]; then
                show_error "Blog post title is required!"
                show_main_dialog
                return
            fi
            
            if [[ -z "$description" ]]; then
                show_error "Description is required!"
                show_main_dialog
                return
            fi
            
            # Show progress dialog
            (
                echo "10" ; echo "# Validating input..."
                sleep 1
                echo "30" ; echo "# Preparing webhook payload..."
                sleep 1
                echo "60" ; echo "# Sending to Discord..."
                
                # Send webhook
                local error_msg
                error_msg=$(send_discord_webhook "$WEBHOOK_URL" "$title" "$description" "$url" "$author_name" "$author_avatar" "$thumbnail" "$color_value" "$BOT_USERNAME" "" "$footer_text" 2>&1)
                
                if [[ $? -eq 0 ]]; then
                    echo "100" ; echo "# Success!"
                    sleep 1
                    echo "SUCCESS"
                else
                    echo "100" ; echo "# Error occurred"
                    sleep 1
                    echo "ERROR:$error_msg"
                fi
            ) | yad --progress --title="Sending Notification" \
                --text="Please wait..." --percentage=0 \
                --width=400 --height=150 --center \
                --auto-close --no-cancel
            
            # Check result
            local progress_result
            progress_result=$(echo $?)
            
            if [[ $progress_result -eq 0 ]]; then
                show_success "Blog notification sent successfully to Discord!"
            else
                show_error "Failed to send notification. Please check your webhook URL and try again."
                show_main_dialog
            fi
            ;;
        2)  # Settings button
            show_settings
            show_main_dialog
            ;;
        1)  # Cancel button
            exit 0
            ;;
    esac
}

# Function to check dependencies
check_dependencies() {
    local missing_deps=()
    
    if ! command -v yad &> /dev/null; then
        missing_deps+=("yad")
    fi
    
    if ! command -v curl &> /dev/null; then
        missing_deps+=("curl")
    fi
    
    if [[ ${#missing_deps[@]} -gt 0 ]]; then
        echo "Error: Missing required dependencies: ${missing_deps[*]}"
        echo "Please install them using your package manager:"
        echo "  Debian/Ubuntu: sudo apt install ${missing_deps[*]}"
        echo "  Arch Linux: sudo pacman -S ${missing_deps[*]}"
        echo "  Fedora: sudo dnf install ${missing_deps[*]}"
        exit 1
    fi
}

# Function to show help
show_help() {
    cat << EOF
$SCRIPT_NAME v$SCRIPT_VERSION

Usage: $0 [OPTIONS]

OPTIONS:
    -h, --help      Show this help message
    -s, --settings  Open settings dialog
    -v, --version   Show version information

DESCRIPTION:
    A GUI application for sending blog post notifications to Discord via webhooks.
    Uses YAD for the graphical interface and supports rich embed formatting.

FEATURES:
    - User-friendly GUI interface
    - Discord webhook integration
    - Rich embed support with colors, thumbnails, and author info
    - Configuration persistence
    - Input validation
    - Progress tracking

SETUP:
    1. Create a Discord webhook in your server
    2. Run the script and configure the webhook URL in settings
    3. Fill in blog post details and send notifications

EOF
}

# Main function
main() {
    case "${1:-}" in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--version)
            echo "$SCRIPT_NAME v$SCRIPT_VERSION"
            exit 0
            ;;
        -s|--settings)
            check_dependencies
            show_settings
            exit 0
            ;;
        "")
            check_dependencies
            show_main_dialog
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use -h or --help for usage information."
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"


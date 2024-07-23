show_truncated_dir() {
  # Shortens given path from '/this/is/an/example/super/long/actually/really/long/path' -> 't/i/a/e/s/l/a/r/l/path'
  shorten_path() {
    local path="$1"
    # local char_limit="$2"
    local shortened_path=""

    # Check if the path length is greater than 30
    if [ ${#path} -gt 20 ]; then
      # Split the path by '/'
      IFS='/' read -ra parts <<< "$path"

      # Store the last part of the path
      local last_part="${parts[${#parts[@]}-1]}"

      # Loop through the parts except the last one
      for ((i=0; i < ${#parts[@]} - 1; i++)); do
        if [ -n "${parts[$i]}" ]; then
          # Append the first character of each part
          shortened_path+="/${parts[$i]:0:1}"
        fi
      done
      # Add the last part of the path (filename or last directory)
      shortened_path+="/${last_part}"
    else
      shortened_path="$path"
    fi

    echo "$shortened_path"
  }

  local index=$1 # This variable is used internally by the module loader in order to know the position of this module
  local icon="$(get_tmux_option "@catppuccin_truncated_dir_icon" " ")"
  local color="$(get_tmux_option "@catppuccin_truncated_dir_color" "")"
  local text="$(get_tmux_option "@catppuccin_truncated_dir_text" "#{pane_current_path}")"

  local shortened_text="$(shorten_path "$text")"

  module=$(build_status_module "$index" "$icon" "$color" "$shortened_text")

  echo "$module"
}

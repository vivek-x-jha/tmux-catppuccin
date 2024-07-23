show_directory() {
  local index icon color text module

  index=$1
  icon=$(get_tmux_option "@catppuccin_directory_icon" " ")
  color=$(get_tmux_option "@catppuccin_directory_color" "")
  text=$(get_tmux_option "@catppuccin_directory_text" "#{pane_current_path}")

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}

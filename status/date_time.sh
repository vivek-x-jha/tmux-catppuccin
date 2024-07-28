show_date_time() {
  local index icon color text module

  index=$1
  icon="$(get_tmux_option "@catppuccin_date_time_icon" " ")"
  color="$(get_tmux_option "@catppuccin_date_time_color" "")"
  text="$(get_tmux_option "@catppuccin_date_time_text" "%a %b %d %I:%M %p")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}

$env.config.history = {
  file_format: "sqlite"
  max_size: 1_000_000
  sync_on_enter: true
  isolation: false
}

$env.config.show_banner = false

$env.config.edit_mode = "vi";
$env.config.cursor_shape.emacs = "line"
$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"

$env.config.completions.algorithm = "substring"
$env.config.highlight_resolved_externals = true

$env.config.use_kitty_protocol = true

$env.config.table.header_on_separator = true
$env.config.table.footer_inheritance = true

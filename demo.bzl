def _demo_impl(ctx):
  out = ctx.actions.declare_file("file")
  out_dir = ctx.actions.declare_directory("dir")
  args = ctx.actions.args()
  args.add_all([out, out_dir])

  ctx.actions.run(
    executable = ctx.executable.bin,
    arguments = [args],
    inputs = [],
    outputs = [out, out_dir],
  )
  return [DefaultInfo(files=depset([out, out_dir]))]



demo = rule(
  implementation = _demo_impl,
  attrs = dict(
    bin = attr.label(executable = True, cfg = "exec"),
  )
)

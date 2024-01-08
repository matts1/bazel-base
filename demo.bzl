def foo_impl(ctx):
  out = ctx.actions.declare_file(ctx.label.name)
  ctx.actions.write(out, "blah")
  return [DefaultInfo(files=depset([out]))]

foo = rule(
  implementation = foo_impl,
)

def foo_child_impl(ctx):
  return ctx.super()

foo_child = rule(
  implementation = foo_child_impl,
  parent = foo,
)

def empty_aspect_impl(target, ctx):
  return []

empty_aspect = aspect(
  implementation = empty_aspect_impl,
  attr_aspects = ["*"],
)

This directory stores the minimum upstream material needed to continue the port after `referencias/` is removed.

It is split into two sources:

- `third_party/jackcess/`: Java sources and notices used as the binary `.accdb` reverse-engineering baseline.
- `third_party/access_tool/`: Python sources used to understand the exported `.accdb.src` layout and the optional Windows automation path.

These files are development references only. They must not become runtime dependencies of the generated tool.

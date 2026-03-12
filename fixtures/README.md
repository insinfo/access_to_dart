This directory contains internal fixtures required for development and tests.

Rules:

- fixtures are checked into the repository on purpose;
- they replace any dependency on `referencias/` for automated tests;
- they are not runtime dependencies for the final converter;
- the main regression corpus is `fixtures/teste1/`, copied from the original research material.

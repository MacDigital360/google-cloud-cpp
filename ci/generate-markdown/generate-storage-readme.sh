#!/usr/bin/env bash
#
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

readonly BINDIR=$(dirname "$0")

cat <<_EOF_
# Google Cloud Storage C++ Client Library

<!-- This file is automatically generated by ci/generate-markdown/$(basename "$0") -->

_EOF_

cat <<'_EOF_'
This directory contains an idiomatic C++ client library for interacting with
[Google Cloud Storage](https://cloud.google.com/storage}/) (GCS), which is
Google's Object Storage service. It allows world-wide storage and retrieval of
any amount of data at any time. You can use Cloud Storage for a range of
scenarios including serving website content, storing data for archival and
disaster recovery, or distributing large data objects to users via direct
download.

Please note that the Google Cloud C++ client libraries do **not** follow
[Semantic Versioning](http://semver.org/).

## Supported Platforms

* Windows, macOS, Linux
* C++11 (and higher) compilers (we test with GCC \>= 4.9, Clang >= 3.8, and MSVC \>= 2019)
* Environments with or without exceptions
* Bazel and CMake builds

## Documentation

* Official documentation about [Google Cloud Storage][cloud-storage-docs]
* [Reference doxygen documentation][doxygen-link] for each release of this client library
* Detailed header comments in our [public `.h`][source-link] files

[doxygen-link]: https://googleapis.dev/cpp/google-cloud-storage/latest/
[cloud-storage-docs]: https://cloud.google.com/storage/docs/
[source-link]: https://github.com/googleapis/google-cloud-cpp/tree/master/google/cloud/storage

## Quickstart

The [quickstart/](quickstart/README.md) directory contains a minimal environment
to get started using this client library in a larger project. The following
"Hello World" program is used in this quickstart, and should give you a taste of
this library.

```cc
_EOF_

# Dumps the contents of quickstart.cc starting at the first #include, so we
# skip the license header comment.
sed -n '/^#/,$p' "${BINDIR}/../../google/cloud/storage/quickstart/quickstart.cc"

cat <<'_EOF_'
````

* Packaging maintainers or developers that prefer to install the library in a
  fixed directory (such as `/usr/local` or `/opt`) should consult the
  [packaging guide](/doc/packaging.md).
* Developers wanting to use the libraries as part of a larger CMake or Bazel
  project should consult the [quickstart guides](#quickstart) for the library
  or libraries they want to use.
* Developers wanting to compile the library just to run some of the examples or
  tests should read the current document.
* Contributors and developers to `google-cloud-cpp` should consult the guide to
  [setup a development workstation][howto-setup-dev-workstation].

[howto-setup-dev-workstation]: /doc/contributor/howto-guide-setup-development-workstation.md

## Contributing changes

See [`CONTRIBUTING.md`](../../../CONTRIBUTING.md) for details on how to
contribute to this project, including how to build and test your changes
as well as how to properly format your code.

## Licensing

Apache 2.0; see [`LICENSE`](../../../LICENSE) for details.

_EOF_

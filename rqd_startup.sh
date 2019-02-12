#!/usr/bin/env sh

#   Copyright 2019 Google LLC
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        https://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#


systemctl restart rsyslog

#mount buckets with gcsfuse
gcsfuse --implicit-dirs -o rw,allow_other --uid 1000 --gid 1000 --dir-mode 777 --file-mode 777 $GCS_FUSE_BUCKET $GCS_FUSE_MOUNT
/opt/opencue/install_and_run.sh
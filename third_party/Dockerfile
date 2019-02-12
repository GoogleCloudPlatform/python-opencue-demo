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
#
# Pull the base image from your local Docker Repository.
# The following line references the base RQD image which you created in the previous step.
FROM opencue/rqd:demo

# Update [YOUR_BUCKET_NAME] with the name of your bucket in the following line:
# This variable is referenced in rqd_startup.sh
ENV GCS_FUSE_BUCKET [YOUR_BUCKET_NAME]


# This is the GCS bucket mount point on your Render Host. /shots is correct for this tutorial. Referenced in rqd_startup.sh
ENV GCS_FUSE_MOUNT /shots

# Create directory mount point
RUN mkdir /shots
RUN chmod 777 /shots

# Install gcsfuse
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin
COPY install_gcsfuse.sh /opt/opencue/
RUN chmod 777 /opt/opencue/install_gcsfuse.sh
RUN /opt/opencue/install_gcsfuse.sh

RUN yum update && \
	yum install -y \
		curl \
		bzip2 \
		libfreetype6 \
		libgl1-mesa-dev \
		libXi-devel  \
		mesa-libGLU-devel \
		zlib-devel \
		libXinerama-devel \
		libXrandr-devel \
	yum -y autoremove && \
	rm -rf /var/lib/apt/lists/*

RUN yum -y install bzip2

ENV BLENDER_MAJOR 2.79
ENV BLENDER_VERSION 2.79
ENV BLENDER_BZ2_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_MAJOR/blender-$BLENDER_VERSION-linux-glibc219-x86_64.tar.bz2

RUN mkdir /usr/local/blender && \
 curl -SL "$BLENDER_BZ2_URL" -o blender.tar.bz2 && \
 tar -jxvf blender.tar.bz2 -C /usr/local/blender --strip-components=1 && \
 rm blender.tar.bz2


COPY rqd_startup.sh /opt/opencue
RUN chmod 777 /opt/opencue/rqd_startup.sh

ENTRYPOINT ["/opt/opencue/rqd_startup.sh"]

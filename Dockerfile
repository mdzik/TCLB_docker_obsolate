FROM travisci/ci-sardonyx:packer-1553530531-f909ac5
RUN sed -i 's/archive/pl\.archive/g' /etc/apt/sources.list
RUN apt-get update
RUN apt install ruby-dev  ruby nvidia-profiler nvidia-cuda-dev nvidia-cuda-toolkit openmpi-bin libopenmpi-dev lcov time r-base-dev r-recommended python-numpy python-dev
RUN git clone https://github.com/travis-ci/travis-build /travis-build
RUN mkdir -p ~/.travis
RUN ln -s /travis-build ~/.travis/travis-build
RUN gem install bundler
RUN cd /travis-build && bundle install --gemfile ~/.travis/travis-build/Gemfile
RUN cd /travis-build && bundler binstubs travis

COPY buildTCLB.sh /

FROM gitlab/gitlab-ce:8.8.5-ce.1
MAINTAINER yujia.qyj@alibaba-inc.com

RUN echo "" \
    && echo "# git clone https://gitlab.com/larryli/gitlab.git" \
    && git clone https://gitlab.com/larryli/gitlab.git \
    && echo "# Generating diff file for translation …” \
    && cd gitlab \
    && git diff origin/8-8-stable..origin/8-8-zh > ../zh_CN_8.8.diff \
    && echo "# Patching diff file …” \
    && patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < ../zh_CN_8.8.diff \
    && echo "# Remove template file …” \
    && cd .. \
    && rm -rf gitlab \
    && rm *.diff       
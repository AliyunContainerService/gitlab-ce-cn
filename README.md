# GitLab 中文社区版

### 通过给GitLab英文社区版打汉化补丁制作。
### base镜像 https://hub.docker.com/r/gitlab/gitlab-ce/  
### 汉化链接 https://gitlab.com/larryli/gitlab.git

##compose模板
```
gitlab:
  image: 'registry.aliyuncs.com/acs-sample/gitlab-ce-cn:8.8.5'
  restart: always
  ports:
    - '80:80'
    - '443:443'
    - '2222:22'
  volumes:
    - '/srv/gitlab/config:/etc/gitlab'
    - '/srv/gitlab/logs:/var/log/gitlab'
    - '/srv/gitlab/data:/var/opt/gitlab'
  labels:
    aliyun.scale: '1'
    aliyun.probe.url: 'tcp://container:80'
    aliyun.probe.initial_delay_seconds: '10'
    aliyun.routing.port_80: gitlab-ce-cn
```

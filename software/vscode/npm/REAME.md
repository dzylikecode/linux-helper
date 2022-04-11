# configuration

npm 获取配置有 6 种方式，优先级由高到底。

- 命令行参数

  > --proxy http://server:port 即将 proxy 的值设为 http://server:port。

- 环境变量

  > 以 npm*config*为前缀的环境变量将会被认为是 npm 的配置属性。如设置 proxy 可以加入这样的环境变量 npm_config_proxy=http://server:port。

- 用户配置文件

  > 可以通过 npm config get userconfig 查看文件路径。如果是 mac 系统的话默认路径就是$HOME/.npmrc。

- 全局配置文件

  > 可以通过 npm config get globalconfig 查看文件路径。mac 系统的默认路径是/usr/local/etc/npmrc。

- 内置配置文件

  > 安装 npm 的目录下的 npmrc 文件。

- 默认配置
  > npm 本身有默认配置参数，如果以上 5 条都没设置，则 npm 会使用默认配置参数。

### command

针对npm配置的命令行操作

```bash
   npm config set <key> <value> [--global]
   npm config get <key>
   npm config delete <key>
   npm config list
   npm config edit
   npm get <key>
   npm set <key> <value> [--global]
```

在设置配置属性时属性值默认是被存储于用户配置文件中，如果加上--global，则被存储在全局配置文件中。

如果要查看npm的所有配置属性（包括默认配置），可以使用npm config ls -l。

如果要查看npm的各种配置的含义，可以使用npm help config

## reference

- [Npm的配置管理及设置代理](https://www.cnblogs.com/huang0925/archive/2013/05/17/3083207.html)
# :construction: DevOps Tool Collection

This is a set of scripts I built to help _me_ to work with automation & deployment stuff. It has
both scripts to help you as a user to get something faster than using vanilla tools, as well as
scripts to make working with _containerized_ applications easier, such as dealing with [waiting for
resources](https://docs.docker.com/compose/startup-order/), a common problem when working with
Docker (or containers in general).

## What's available

### Deploy automation

* **[terraform-auto](deploy-tools/terraform-auto)** - Wrapper around Terraform to provide
	automation-friendly features, such as automatic initialization and support for environment
	variables on backend configuration.
* **[simple-ansible-provision](deploy-tools/simple-ansible-provision)** - Provision ansible
	playbooks with an easier CLI and automatic download of [Galaxy](https://galaxy.ansible.com/)
	dependencies.
* **[ecs-wait-for-ec2-join-cluster](deploy-tools/ecs-wait-for-ec2-join-cluster)** - Helps you build
	scalable applications on [AWS ECS](https://aws.amazon.com/ecs/) with zero-downtime deployments.
* **[ecs-wait-for-container-instances](deploy-tools/ecs-wait-for-container-instances)** - Helps you
	build applications on [AWS ECS](https://aws.amazon.com/ecs/) with zero-downtime deployments.

### For containers

* **[wait-for](container-tools/wait-for)** - Manage initialization order dependency on different
	containers. See more about this [here](https://docs.docker.com/compose/startup-order/).

## Installation

You can just pick what you need and copy it or install them using one of the methods below:

### :rocket: Deployment tools

#### Arch Linux

Build this [PKGBUILD](https://github.com/kriansa/PKGBUILDs/blob/master/pkgs/devops-tools-git/PKGBUILD):

```shell
$ wget https://raw.githubusercontent.com/kriansa/PKGBUILDs/master/pkgs/devops-tools-git/PKGBUILD
$ makepkg -fsric
```

#### Other platforms

For now you can either clone this repo or download the last release and put the files into a folder
in your `$PATH`. If you want proper packages, [pull-requests are welcome!](CONTRIBUTING.md)

### :package: Container tools

Beware to replace the `DOTC_VERSION` by the actual version you want
[here](https://github.com/kriansa/devops-tools/releases).

```Dockerfile
# If you're using Ubuntu or Debian. If you're using another base image, install wget
RUN apt-get update && apt-get install -y wget

ARG DOTC_VERSION vX.Y.Z # Please refer to the Releases page to get the latest one
RUN wget https://github.com/kriansa/devops-tools/archive/$DOTC_VERSION.tar.gz \
	&& tar -xzvpf $DOTC_VERSION.tar.gz \
	&& cp $DOTC_VERSION/container-tools/* /usr/local/bin
	&& rm -rf $DOTC_VERSION.tar.gz $DOTC_VERSION
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would
like to change.

Please make sure to update docs as appropriate. For more information, please refer to
[Contributing](CONTRIBUTING.md).

## Other projects

- [Dockerize](https://github.com/jwilder/dockerize) - Helps you simplify applications running in
	containers.

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE.md](LICENSE.md) file for
details.

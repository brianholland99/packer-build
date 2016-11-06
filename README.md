# Packer build of boxes

## Current boxes:

* Minimal Centos 7.2 (/m/boxes/vagrant-vb/min-centos7.2.box)

## Description

This builds a VM from the minimal install ISO.  This was not currently an
attempt to build the smallest box, so does not strip too much out from a
minimal install.

The goal was to provide a box that could be used to be controlled by
saltstack.

Variables are used to allow some parameters to be controlled by defnition
files or command-line arguments.

## Versions used for build to deploy

The following versions have been used from building the boxes to
deploying via vagrant.  This only uses packer, but the resulting box was
then used with Vagrant and Virtualbox.

* OS Ubuntu 16.04 LTS
* Packer 0.10.2
* Vagrant 1.8.6
* Virtualbox 5.1.8

## Instructions

To build the box, run the following from this directory.

* `packer build centos7.2.json`

When a new version of a box is built, remove the previous instance from
vagrant's box list or the new box will not be picked up.

* `vagrant box list  # To see if it is there`
* `vagrant remove box-name-just-built  # If built box is in list`

## Cleanup

To clean up remnants, run the following command from this directory. This
does not clean up boxes that are output to a separate directory.

`./clean.sh`

## Notes

### Kernel upgrade

The packer file updates the kernel. Note: After updating, reboot should
be done as is done in the sequencing of the scripts. Basically, include the
scripts/reboot.sh directly after the use of scripts/updateKernel.sh

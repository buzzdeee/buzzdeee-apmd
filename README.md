# apmd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with apmd](#setup)
    * [What apmd affects](#what-apmd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with apmd](#beginning-with-apmd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages the OpenBSD apmd daemon.

## Module Description

The module basically just takes care of configuring the service.

## Setup

### What apmd affects

* apmd_flags in /etc/rc.conf.local
* state of apmd

## Usage

```
include apmd
```

## Reference

### Parameters

service_ensure	running, stopped etc., architecture dependent

service_enable	bool true, false, architecture dependent

service_flags	The flags that go into /etc/rc.conf.local, architecture dependent

### Facts

apm_arch	bool set to true, false, depending on architecture

## Limitations

There might be some

## Development

Contributions are welcome.


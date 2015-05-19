# Parcel :package:

## Purpose 

A custom package repository that is easy to deploy and maintain. 
 
## Overview

### Creating Packages 

Packages are added and maintained in the `src/` dir.

```
└── src
    └── castiron-name_of_package
        ├── README.md
        ├── build.sh
        └── releases
            └── castiron-name_of_package_1.0.1_amd64.deb
```

The toplevel package dir should be named based on the package name with `castiron-` prepended. 
The `README.md` should at a minimum contain the checkinstall configuration.
The `build.sh` script is an automated way to create the .deb using checkinstall. This will be reused in the future to build the updated .deb package.
The `releases/` dir contains the .deb packages. 

#### Package Naming

Packages should be named using the following convention: 

`castiron-` followed by the name of the package `jerrys_magic_package` followed by the version `_2.3.5` followed by the targeted architecture `_amd64` and finally the extensions `.deb`
 All together: `castiron_jerrys_magic_package_2.3.5_amd64.deb`


### Deployment

When the application is deployed using Capistrano, a bash script (`config/setup.sh`) searches through the `src/` dir and creates symlinks to all .deb packages in the `debs/` dir.
Following the creation of the symlinks the `dpkg-scanpackages` is run and `Packages.gz` is generated which apt uses to get a list of the packages.

If you visit the package repo from your browser (http://parcel.cichq.com) your package should be visible. 


### Adding the Repo 

#### Manual 

Edit the `/etc/apt/sources.list ` file and add the following: 

`deb http://parcel.cichq.com/debs/ amd64/`

Update apt: 

`sudo apt-get update`

Search for Parcel packages: 

`sudo apt-cache search 'castiron'`

#### Puppet 

See: https://forge.puppetlabs.com/puppetlabs/apt




That's all for now. Enjoy. 
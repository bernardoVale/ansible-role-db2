DB2
=========


Simple role to install IBM DB2 
[![Build Status](https://travis-ci.org/bernardoVale/ansible-role-db2.svg?branch=master)](https://travis-ci.org/bernardoVale/ansible-role-db2)

Requirements
------------
You need a copy of DB2 compressed. The role can download from a remote URL or use a local copy of DB2 present on your ansible host.

**ROOT ACCESS**

This role can only be used with root access. DB2 can be installed without root but many features like creating instances
are only available as **root**. Make sure you're installing with root user or using privillege escalation with **sudo**.


Role Variables
--------------

###DB2_BINARY

This hash controls how to send the DB2 binary to the remote hosts.

**db2_binary.url**: A URL to download db2 (dont set this if you want to use a local copy)

**db2_binary.location**: A path to save the remote file or to get the file if url wasn't defined

**db2_binary.dest**: Where the role should decompress DB2 on remote host.


    db2_binary:
        url: https://mycompany.com/downloads/db2_10_5.tar.gz
        location: /ansible/files/db2_10.5.tar.gz
        dest: /tmp

 Check how to download DB2 from a remote URL [here](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/downloading_db2.yml)
 
 If you have a local copy use this [example](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/local_db2.yml)

###DB2_CREATES

The DB2 tar.gz usually creates a folder named `server`, but there are some binaries that creates different folders, for example DB2 Express C create a folder named `expc`. If your tar.gz creates a different folder, change this variable. For example:

    db2_creates: expc

###DB2_PACKAGES

The list of packages that the role should install before running the installer. Leave as default unless you know what you're doing.

DB2 requires some packages to run properly on Linux, you can read more about this [here](https://www-01.ibm.com/support/knowledgecenter/SSEPGG_10.5.0/com.ibm.db2.luw.qb.server.doc/doc/r0008865.html?lang=en)

###RESP

This hash is used to customize the DB2 installation.

**prod:** Witch product will be installed

**file:** Where should install DB2

**lic_agreement:** Accept or decline the license (If decline the DB2 won't be installed)

**install_type:** Customizations of the products that will be installed

    resp:
       prod: "DB2_SERVER_EDITION"
       file: "/opt/ibm/db2/V10.5"
       lic_agreement: "ACCEPT" # ACCEPT or DECLINE
       install_type: "TYPICAL" # TYPICAL, COMPACT, CUSTOM

For **DB2 Express-C** (Check this [file](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/db2_express-c_example.yml) ):

     resp:
       prod: "EXPRESS_C"
       file: "/opt/ibm/db2/V10.1"
       lic_agreement: "ACCEPT" # ACCEPT or DECLINE
       install_type: "TYPICAL" # TYPICAL, COMPACT, CUSTOM

      
**NOTE**: By using this role, you're accepting [IBM license](http://www-03.ibm.com/software/sla/sladb.nsf/search/).

Dependencies
------------
None

Example Playbook
----------------
All custom options are provided through an example file on [examples folder](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/)


You need at least specify where to get DB2. [Downloading db2](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/downloading_db2.yml)

    - hosts: servers
      roles:
         - db2
      vars:
        db2_binary:
          location: /ansible/files/db2_10.5.tar.gz
           dest: /tmp

###Creating a custom instance

The instance will be created using all DB2 defaults, but you can customize it using the hash **db2_instances**

The full example [here](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/custom_instance.yml)

    db2_instances:
         - instance: "DB2INST"
           name: "myinstan" 
           group_name: "myinadm"
           fenced_username: "myfenc1"
           fenced_group_name: "myfadm1"
           
**db2_instances** is a list of instances, yo can create more than one, an example of two instances is found [here](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/multiples_instances.yml)

###Customizing Parameters

Both global and instance parameters can be customized.

Define hash `dbm_params` and set any `key: value` DB2 parameter. The key must be a valid DB2 parameter.

    db2_instances:
        - instance: "DB2INST"
          name: "myinstan" 
          group_name: "myinadm"
          fenced_username: "myfenc1"
          fenced_group_name: "myfadm1"
          dbm_params:
            intra_parallel: "YES"
            numdb: "20"
            
The full example [here](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/instance_with_custom_params.yml)

### Global parameters

Global parameters are provided by defining `global_params` hash.

    global_params:
        db2_antijoin: "YES"
        db2fcmcomm: "TCPIP4"
 
 The full example [here](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/global_profile.yml)
        

###Creating databases

By default this role won't create databases, if you want to, define the hash list `databases`

The full example is found [here](https://github.com/bernardoVale/ansible-role-db2/tree/master/examples/databases.yml)

    databases:
        - name: mydb
          instance: db2inst1
        - name: otherdb
          instance: db2inst2
          codeset: "UTF-8"
          territory: "en"
          pagesize: "16384"
 

Disclaimer
---------
There still some work to be done. There's no warranty that the role will work for you.

Developing
--------
If you're interested in helping please full a issue or just send me a pull request.

License
-------

BSD

Author Information
------------------
[Bernardo Vale](https://github.com/bernardoVale)

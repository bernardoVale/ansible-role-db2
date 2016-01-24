DB2
=========

Simple role to install IBM DB2

Requirements
------------
You need a copy of DB2 compressed. The role can download from a remote URL or use a local copy of DB2 present on your ansible host.

Role Variables
--------------

###DB2_BINARY

This hash controls how to send the DB2 binary to the remote hosts.

**db2_binary.url**: A URL to download db2 (dont set this if you want to use a local copy)

**db2_binary.location**: A path to save the remote file or to get the file if url wasn't defined

**db2_binary.dest**: Where the role should decompress DB2 on remote host.


    db2_binary:
        url: htttps://mycompany.com/downloads/db2_10_5.tar.gz
        location: /ansible/files/db2_10.5.tar.gz
        dest: /tmp
        
        
 Check how to download DB2 from a remote URL [here](examples/downloading_db2.yml)
 
 If you have a local copy use this [example](examples/local_db2.yml)

**DB2_PACKAGES**

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
      
**NOTE**: By using this role, you're accepting [IBM license](http://www-03.ibm.com/software/sla/sladb.nsf/search/).

Dependencies
------------
None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - db2

License
-------

BSD

Author Information
------------------
[Bernardo Vale](https://github.com/bernardoVale)

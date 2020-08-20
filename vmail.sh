#!/bin/sh
groupadd -g 10000 vmail
useradd -g 10000 -u 10000 -s /sbin/nologin vmail

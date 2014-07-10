cd /etc/init.d/ ;

#service libvirt-bin restart;

for i in $(ls neutron-*);
do service $i restart
done

for i in $(ls nova-*);
do service $i restart
done

cd /


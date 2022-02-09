vmdk = https://cloud-images.ubuntu.com/daily/server/focal/current/focal-server-cloudimg-amd64.vmdk

all: dot.vmdk cloudinit.iso storage.vmdk dot.vmx

dot.vmx: dot.vmx.src
	cp $? $@

dot.vmdk: 
	curl -L "$(vmdk)" -o dot.vmdk

cloudinit.iso: meta-data network-config user-data
	mkisofs -output cloudinit.iso -volid cidata -joliet -rock meta-data user-data network-config

storage.vmdk: 
	vmware-vdiskmanager.exe -c -s 100MB -a lsilogic -t 0 "storage.vmdk"

start: all
	vmrun.exe start dot.vmx

clean:
	rm dot.vmdk cloudinit.iso vmware*.log vm*.scoreboard mksSandbox*.log dot.vmxf dot.vmsd dot.vmx dot.nvram storage.vmdk

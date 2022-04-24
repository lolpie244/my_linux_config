# INSTALL REQUIREDS:
## Pacman packeds
```
sudo pacman -S archlinux-keyring
sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat
```
## drivers
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso \
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win-guest-tools.exe

# INSTALLATION
1) Turn on service:
```
sudo systemctl enable libvirtd.service 
sudo systemctl start libvirtd.service
```
---
2) create vm in virt-managet \
![image](https://user-images.githubusercontent.com/86479624/164980047-b1264cbf-79cf-4312-ba83-404b780c0b1a.png)\
![image](https://user-images.githubusercontent.com/86479624/164980060-8704d229-e28a-4182-bc08-28d82ee792da.png)\
![image](https://user-images.githubusercontent.com/86479624/164980106-534ee4f6-115d-419e-8d3e-2b9fa32445b6.png)\
and add drivers
---
3) 

# GPU
1) edit `/etc/default/grub` and add \
 > GRUB_CMDLINE_LINUX_DEFAULT="quiet ... **intel_iommu=on**"
2) reconfig grub with command `sudo grub-mkconfig -o /boot/grub/grub.cfg` and reboot pc
3) edit `/etc/mkinitcpio.conf`
	* add `vfio vfio_iommu_type1 vfio_pci vfio_virqfd nouveau` to the begin of `MODULES="..."`

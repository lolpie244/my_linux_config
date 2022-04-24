# INSTALL REQUIREDS:
## Pacman packeds
```
sudo pacman -S archlinux-keyring
sudo pacman -S libvirt virt-manager ovmf qemu
```
## drivers
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso \
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win-guest-tools.exe

# INSTALLATION
1) edit `/etc/libvirt/qemu.conf` and add 
```
nvram = ["/usr/share/ovmf/ovmf_code_x64.bin:/usr/share/ovmf/ovmf_vars_x64.bin"]
```
1) Turn on service:
```
sudo systemctl start libvirtd.service 
sudo systemctl start virtlogd.socket
sudo systemctl enable libvirtd.service
sudo systemctl enable virtlogd.socket
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
3) write `lspci -nn`, search video and audio and write down somewhere codes
> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation TU116M [GeForce GTX 1660 Ti Mobile] [**10de:2191**] (rev a1)\
01:00.1 Audio device [0403]: NVIDIA Corporation TU116 High Definition Audio Controller [**10de:1aeb**] (rev a1)
4) edit `/etc/modprobe.d/vfio.conf` with `options vfio-pci ids=*your_video_id*,*your_audio_id*`. For example:
```
options vfio-pci ids=10de:2191,10de:1aeb
``` 
5) edit `/etc/mkinitcpio.conf`
	* add `vfio vfio_iommu_type1 vfio_pci vfio_virqfd nouveau` to the begin of `MODULES="..."`
	* add `modconf` to the begin of `HOOKS = "..."`
6) rebild initramfs
`
sudo mkinitcpio -g /boot/linux-custom.img and reboot pc

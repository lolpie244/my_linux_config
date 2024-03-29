# INSTALL REQUIREDS:
## Pacman packeds
```
sudo pacman -S archlinux-keyring qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables libguestfs
```
## drivers
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso \
https://www.spice-space.org/download/windows/spice-guest-tools/spice-guest-tools-latest.exe 

# INSTALLATION
1) Turn on service:
```
sudo systemctl enable --now libvirtd.service
sudo systemctl enable --now virtlogd.socket
```
---
2) create vm in virt-managet \
![image](https://user-images.githubusercontent.com/86479624/164980047-b1264cbf-79cf-4312-ba83-404b780c0b1a.png)\
![image](https://user-images.githubusercontent.com/86479624/164980060-8704d229-e28a-4182-bc08-28d82ee792da.png)\
![image](https://user-images.githubusercontent.com/86479624/164980106-534ee4f6-115d-419e-8d3e-2b9fa32445b6.png)\
![image](https://user-images.githubusercontent.com/86479624/167599275-b4e24938-60e0-483e-8abd-1f9ab47c859e.png)\
and add drivers
---
3) 

# GPU
1) edit `/etc/default/grub` and add \
 > GRUB_CMDLINE_LINUX_DEFAULT="quiet ... **intel_iommu=on**"
2) reconfig grub with command `sudo grub-mkconfig -o /boot/grub/grub.cfg` and **reboot pc**
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
```
sudo mkinitcpio -g /boot/linux-custom.img
sudo mkinitcpio -P
```
and **reboot pc**

7) run `lspci -nnk` and check, if it look like this
> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation TU116M [GeForce GTX 1660 Ti Mobile] [10de:2191] (rev a1)\
	Subsystem: Lenovo Device [17aa:3fc7]\
	Kernel driver in use: **vfio-pci**\
	Kernel modules: nouveau, nvidia_drm, nvidia\
01:00.1 Audio device [0403]: NVIDIA Corporation TU116 High Definition Audio Controller [10de:1aeb] (rev a1)\
	Subsystem: Lenovo Device [17aa:3fc7]\
	Kernel driver in use: **vfio-pci**\
	Kernel modules: snd_hda_intel
8) add your gpu, sound and all usb in vm (they are in PCI HOST DEVICE) BUT mouse don't work and i don't know how to fix it

# vim: set et ts=4 sw=4:
#*****************************************************************************
# 
#  Copyright (c) 2013 Angelo Naselli <anaselli@linux.it>
#  from drakx services
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2, as
#  published by the Free Software Foundation.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
# 
#*****************************************************************************

package AdminPanel::Services::services;




#-######################################################################################
#- misc imports
#-######################################################################################

use strict;
use common;
use run_program;

use yui;
use AdminPanel::Shared;

use File::Basename;

sub description {
    my %services = (
acpid => N_("Listen and dispatch ACPI events from the kernel"),	    
alsa => N_("Launch the ALSA (Advanced Linux Sound Architecture) sound system"),
anacron => N_("Anacron is a periodic command scheduler."),
apmd => N_("apmd is used for monitoring battery status and logging it via syslog.
It can also be used for shutting down the machine when the battery is low."),
atd => N_("Runs commands scheduled by the at command at the time specified when
at was run, and runs batch commands when the load average is low enough."),
'avahi-deamon' => N_("Avahi is a ZeroConf daemon which implements an mDNS stack"),
chronyd => N_("An NTP client/server"),
cpufreq => N_("Set CPU frequency settings"),
crond => N_("cron is a standard UNIX program that runs user-specified programs
at periodic scheduled times. vixie cron adds a number of features to the basic
UNIX cron, including better security and more powerful configuration options."),
cups => N_("Common UNIX Printing System (CUPS) is an advanced printer spooling system"),
dm => N_("Launches the graphical display manager"),
fam => N_("FAM is a file monitoring daemon. It is used to get reports when files change.
It is used by GNOME and KDE"),
g15daemon => N_("G15Daemon allows users access to all extra keys by decoding them and 
pushing them back into the kernel via the linux UINPUT driver. This driver must be loaded 
before g15daemon can be used for keyboard access. The G15 LCD is also supported. By default, 
with no other clients active, g15daemon will display a clock. Client applications and 
scripts can access the LCD via a simple API."),
gpm => N_("GPM adds mouse support to text-based Linux applications such the
Midnight Commander. It also allows mouse-based console cut-and-paste operations,
and includes support for pop-up menus on the console."),
haldaemon => N_("HAL is a daemon that collects and maintains information about hardware"),
harddrake => N_("HardDrake runs a hardware probe, and optionally configures
new/changed hardware."),
httpd => N_("Apache is a World Wide Web server. It is used to serve HTML files and CGI."),
inet => N_("The internet superserver daemon (commonly called inetd) starts a
variety of other internet services as needed. It is responsible for starting
many services, including telnet, ftp, rsh, and rlogin. Disabling inetd disables
all of the services it is responsible for."),
ip6tables => N_("Automates a packet filtering firewall with ip6tables"),
iptables => N_("Automates a packet filtering firewall with iptables"),
irqbalance => N_("Evenly distributes IRQ load across multiple CPUs for enhanced performance"),
keytable => N_("This package loads the selected keyboard map as set in
/etc/sysconfig/keyboard.  This can be selected using the kbdconfig utility.
You should leave this enabled for most machines."),
kheader => N_("Automatic regeneration of kernel header in /boot for
/usr/include/linux/{autoconf,version}.h"),
kudzu => N_("Automatic detection and configuration of hardware at boot."),
'laptop-mode' => N_("Tweaks system behavior to extend battery life"),
linuxconf => N_("Linuxconf will sometimes arrange to perform various tasks
at boot-time to maintain the system configuration."),
lpd => N_("lpd is the print daemon required for lpr to work properly. It is
basically a server that arbitrates print jobs to printer(s)."),
lvs => N_("Linux Virtual Server, used to build a high-performance and highly
available server."),
mandi => N_("Monitors the network (Interactive Firewall and wireless"),
mdadm => N_("Software RAID monitoring and management"),
messagebus => N_("DBUS is a daemon which broadcasts notifications of system events and other messages"),
msec => N_("Enables MSEC security policy on system startup"),
named => N_("named (BIND) is a Domain Name Server (DNS) that is used to resolve host names to IP addresses."),
netconsole => N_("Initializes network console logging"),
netfs => N_("Mounts and unmounts all Network File System (NFS), SMB (Lan
Manager/Windows), and NCP (NetWare) mount points."),
network => N_("Activates/Deactivates all network interfaces configured to start
at boot time."),
'network-auth' => N_("Requires network to be up if enabled"),
'network-up' => N_("Wait for the hotplugged network to be up"),
nfs => N_("NFS is a popular protocol for file sharing across TCP/IP networks.
This service provides NFS server functionality, which is configured via the
/etc/exports file."),
nfslock => N_("NFS is a popular protocol for file sharing across TCP/IP
networks. This service provides NFS file locking functionality."),
ntpd => N_("Synchronizes system time using the Network Time Protocol (NTP)"),
numlock => N_("Automatically switch on numlock key locker under console
and Xorg at boot."),
oki4daemon => N_("Support the OKI 4w and compatible winprinters."),
partmon => N_("Checks if a partition is close to full up"),
pcmcia => N_("PCMCIA support is usually to support things like ethernet and
modems in laptops.  It will not get started unless configured so it is safe to have
it installed on machines that do not need it."),
portmap => N_("The portmapper manages RPC connections, which are used by
protocols such as NFS and NIS. The portmap server must be running on machines
which act as servers for protocols which make use of the RPC mechanism."),
portreserve => N_("Reserves some TCP ports"),
postfix => N_("Postfix is a Mail Transport Agent, which is the program that moves mail from one machine to another."),
random => N_("Saves and restores system entropy pool for higher quality random
number generation."),
rawdevices => N_("Assign raw devices to block devices (such as hard disk drive
partitions), for the use of applications such as Oracle or DVD players"),
resolvconf => N_("Nameserver information manager"),
routed => N_("The routed daemon allows for automatic IP router table updated via
the RIP protocol. While RIP is widely used on small networks, more complex
routing protocols are needed for complex networks."),
rstatd => N_("The rstat protocol allows users on a network to retrieve
performance metrics for any machine on that network."),
rsyslog => N_("Syslog is the facility by which many daemons use to log messages to various system log files.  It is a good idea to always run rsyslog."),
rusersd => N_("The rusers protocol allows users on a network to identify who is
logged in on other responding machines."),
rwhod => N_("The rwho protocol lets remote users get a list of all of the users
logged into a machine running the rwho daemon (similar to finger)."),
saned => N_("SANE (Scanner Access Now Easy) enables to access scanners, video cameras, ..."),
shorewall => N_("Packet filtering firewall"),
smb => N_("The SMB/CIFS protocol enables to share access to files & printers and also integrates with a Windows Server domain"),
sound => N_("Launch the sound system on your machine"),
'speech-dispatcherd' => N_("layer for speech analysis"),
sshd => N_("Secure Shell is a network protocol that allows data to be exchanged over a secure channel between two computers"),
syslog => N_("Syslog is the facility by which many daemons use to log messages
to various system log files.  It is a good idea to always run syslog."),
'udev-post' => N_("Moves the generated persistent udev rules to /etc/udev/rules.d"),
usb => N_("Load the drivers for your usb devices."),
vnStat => N_("A lightweight network traffic monitor"),
xfs => N_("Starts the X Font Server."),
xinetd => N_("Starts other deamons on demand."),
    );
    my ($name) = @_;
    my $s = $services{$name};
    if ($s) {
        $s = translate($s);
    } else {
        my $file = "$::prefix/usr/lib/systemd/system/$name.service";
        if (-e $file) {
                $s = cat_($file);
                $s = $s =~ /^Description=(.*)/mg ? $1 : '';
        } else {
                $file = find { -e $_ } map { "$::prefix$_/$name" } '/etc/rc.d/init.d', '/etc/init.d', '/etc/xinetd.d';
                $s = cat_($file);
                $s =~ s/\\\s*\n#\s*//mg;
                $s =
                        $s =~ /^#\s+(?:Short-)?[dD]escription:\s+(.*?)^(?:[^#]|# {0,2}\S)/sm ? $1 :
                        $s =~ /^#\s*(.*?)^[^#]/sm ? $1 : '';

                $s =~ s/#\s*//mg;
        }
    }
    $s =~ s/\n/ /gm; $s =~ s/\s+$//;
    $s;
}


## serviceInfo sets widgets accordingly to selected service status 
## param
##   'service'     service name 
##   'infoPanel'   service information widget 
sub serviceInfo {
    my ($service, $infoPanel) = @_;

    yui::YUI::ui()->blockEvents();
    ## infoPanel
    $infoPanel->setValue(formatAlaTeX(description($service)));
    yui::YUI::ui()->unblockEvents();
}

sub serviceStatus {
    my ($tbl, $item) = @_;

    my $started = (is_service_running($item->label())? N("running") : N("stopped"));
# TODO add icon green/red led  
    my $cell   = $tbl->toCBYTableItem($item)->cell(1);
    if ($cell) {
        $cell->setLabel($started);
        $tbl->cellChanged($cell);
    }
}

## draw service panel and manage it 
sub servicePanel {
    my ($l, $on_services) = services();
    my @xinetd_services = map { $_->[0] } xinetd_services();

    my $mageiaPlugin = "mga";
    my $factory      = yui::YUI::widgetFactory;
    my $mgaFactory   = yui::YExternalWidgets::externalWidgetFactory($mageiaPlugin);
    $mgaFactory      = yui::YMGAWidgetFactory::getYMGAWidgetFactory($mgaFactory);
    
    my $dialog  = $factory->createMainDialog;
    my $vbox    = $factory->createVBox( $dialog );
    my $frame   = $factory->createFrame ($vbox, N("Services"));

    my $frmVbox = $factory->createVBox( $frame );
    my $hbox = $factory->createHBox( $frmVbox );

    my $yTableHeader = new yui::YTableHeader();
    $yTableHeader->addColumn(N("Service"), $yui::YAlignBegin);
    $yTableHeader->addColumn(N("Status"),  $yui::YAlignCenter);
    $yTableHeader->addColumn(N("On boot"), $yui::YAlignBegin);

    ## service list (serviceBox)
    my $serviceTbl = $mgaFactory->createCBTable($hbox, $yTableHeader, $yui::YCBTableCheckBoxOnLastColumn);
    my $itemCollection = new yui::YItemCollection;
    foreach (@$l) {
        my $serviceName = $_;
        
        my $item = new yui::YCBTableItem($serviceName);
        my $started = (is_service_running($serviceName)? N("running") : N("stopped"));
# TODO add icon green/red led  
        my $cell   = new yui::YTableCell($started);
        $item->addCell($cell);
        $item->check(member($serviceName, @$on_services));
        $item->setLabel($serviceName);
        $itemCollection->push($item);
        $item->DISOWN();
    }
    $serviceTbl->addItems($itemCollection);
    $serviceTbl->setImmediateMode(1);
    $serviceTbl->setWeight(0, 50);

    ## info panel (infoPanel)
    $frame   = $factory->createFrame ($hbox, N("Information"));
    $frame->setWeight(0, 30);
    $frmVbox = $factory->createVBox( $frame );
    my $infoPanel = $factory->createRichText($frmVbox, "--------------"); #, 0, 0);
    $infoPanel->setAutoScrollDown();

    ### Service Start button ($startButton)
    $hbox = $factory->createHBox( $frmVbox );
    my $startButton = $factory->createPushButton($hbox, N("Start"));
    
    ### Service Stop button ($stopButton)
    my $stopButton  = $factory->createPushButton($hbox, N("Stop"));

    # dialog buttons
    $factory->createVSpacing($vbox, 1.0);
    ## Window push buttons
    $hbox = $factory->createHBox( $vbox );
    my $align = $factory->createLeft($hbox);
    $hbox     = $factory->createHBox($align);
    my $aboutButton = $factory->createPushButton($hbox, N("About") );
    $align = $factory->createRight($hbox);
    $hbox     = $factory->createHBox($align);
    my $closeButton = $factory->createPushButton($hbox, N("Close") );

    #first item status
    my $item = $serviceTbl->selectedItem();
    serviceInfo($item->label(), $infoPanel) if ($item);

    while(1) {
        my $event     = $dialog->waitForEvent();
        my $eventType = $event->eventType();
        
        #event type checking
        if ($eventType == $yui::YEvent::CancelEvent) {
            last;
        }
        elsif ($eventType == $yui::YEvent::WidgetEvent) {
            # widget selected
            my $widget = $event->widget();

            if ($widget == $closeButton) {
                last;
            }
            elsif ($widget == $aboutButton) {
                my $license = translate($::license);
                # TODO fix version value
                AboutDialog({ name => N("Services and daemons"),
                    version => "1.0.0",
                    copyright => N("Copyright (C) %s Mageia community", '2013'),
                    license => $license, 
                    comments => N("Service Manager is is the Mageia service and daemon management tool \n(from the original idea of Mandriva draxservice)."),
                    website => 'http://www.mageia.org',
                    website_label => N("Mageia"),
                    authors => "Angelo Naselli <anaselli\@linux.it>\nMatteo Pasotti <matteo.pasotti\@gmail.com>",
                    translator_credits =>
                        #-PO: put here name(s) and email(s) of translator(s) (eg: "John Smith <jsmith@nowhere.com>")
                        N("_: Translator(s) name(s) & email(s)\n")}
                );
            }
            elsif ($widget == $serviceTbl) {
                # service selection changed
                $item = $serviceTbl->selectedItem();
                serviceInfo($item->label(), $infoPanel) if ($item);
                $item = $serviceTbl->changedItem();
                if ($item) {
                    _set_service($item->label(), $item->checked());
                    # we can push/pop service, but this (slower) should return real situation
                    ($l, $on_services) = services();
                }
            }
            elsif ($widget == $startButton) {
                $item = $serviceTbl->selectedItem();
                if ($item) {
                    restart_or_start($item->label());
                    # we can push/pop service, but this (slower) should return real situation
                    ($l, $on_services) = services();
                    serviceStatus($serviceTbl, $item);
                }
            }
            elsif ($widget == $stopButton) {
                $item = $serviceTbl->selectedItem();
                if ($item) {
                    stop($item->label());
                    # we can push/pop service, but this (slower) should return real situation
                    ($l, $on_services) = services();
                    serviceStatus($serviceTbl, $item);
                }
            }
        }
    }
    $dialog->destroy();
}


sub _set_service {
    my ($service, $enable) = @_;
    
    my @xinetd_services = map { $_->[0] } xinetd_services();

    if (member($service, @xinetd_services)) {
        run_program::rooted($::prefix, "chkconfig", $enable ? "--add" : "--del", $service);
    } elsif (running_systemd() || has_systemd()) {
        # systemctl rejects any symlinked units. You have to enabled the real file
        if (-l "/lib/systemd/system/$service.service") {
            $service = basename(readlink("/lib/systemd/system/$service.service"));
        } else {
            $service = $service . ".service";
        }
        run_program::rooted($::prefix, "/bin/systemctl", $enable ? "enable" : "disable", $service);
    } else {
        my $script = "/etc/rc.d/init.d/$service";
        run_program::rooted($::prefix, "chkconfig", $enable ? "--add" : "--del", $service);
        #- FIXME: handle services with no chkconfig line and with no Default-Start levels in LSB header
        if ($enable && cat_("$::prefix$script") =~ /^#\s+chkconfig:\s+-/m) {
            run_program::rooted($::prefix, "chkconfig", "--level", "35", $service, "on");
        }
    }
}

sub _run_action {
    my ($service, $action) = @_;
    if (running_systemd()) {
        run_program::rooted($::prefix, '/bin/systemctl', '--no-block', $action, "$service.service");
    } else {
        run_program::rooted($::prefix, "/etc/rc.d/init.d/$service", $action);
    }
}

sub running_systemd() {
    run_program::rooted($::prefix, '/bin/mountpoint', '-q', '/sys/fs/cgroup/systemd');
}

sub has_systemd() {
    run_program::rooted($::prefix, '/bin/rpm', '-q', 'systemd');
}

sub xinetd_services() {
    local $ENV{LANGUAGE} = 'C';
    my @xinetd_services;
    foreach (run_program::rooted_get_stdout($::prefix, '/sbin/chkconfig', '--list', '--type', 'xinetd')) {
        if (my ($xinetd_name, $on_off) = m!^\t(\S+):\s*(on|off)!) {
            push @xinetd_services, [ $xinetd_name, $on_off eq 'on' ];
        }
    }
    @xinetd_services;
}

sub _systemd_services() {
    local $ENV{LANGUAGE} = 'C';
    my @services;
    my %loaded;
    # Running system using systemd
    log::explanations("Detected systemd running. Using systemctl introspection.");
    foreach (run_program::rooted_get_stdout($::prefix, '/bin/systemctl', '--full', '--all', 'list-units')) {
        if (my ($name) = m!^(\S+)\.service\s+loaded!) {
            # We only look at non-template, non-linked service files in /lib
            # We also check for any non-masked sysvinit files as these are
            # also handled by systemd
            if ($name !~ /.*\@$/g && (-e "$::prefix/lib/systemd/system/$name.service" or -e "$::prefix/etc/rc.d/init.d/$name") && ! -l "$::prefix/lib/systemd/system/$name.service") {
                push @services, [ $name, !!run_program::rooted($::prefix, '/bin/systemctl', '--quiet', 'is-enabled', "$name.service") ];
                $loaded{$name} = 1;
            }
        }
    }
    # list-units will not list disabled units that can be enabled
    foreach (run_program::rooted_get_stdout($::prefix, '/bin/systemctl', '--full', 'list-unit-files')) {
        if (my ($name) = m!^(\S+)\.service\s+disabled!) {
            # We only look at non-template, non-linked service files in /lib
            # We also check for any non-masked sysvinit files as these are
            # also handled by systemd
            if (!exists $loaded{$name} && $name !~ /.*\@$/g && (-e "$::prefix/lib/systemd/system/$name.service" or -e "$::prefix/etc/rc.d/init.d/$name") && ! -l "$::prefix/lib/systemd/system/$name.service") {
                # Limit ourselves to "standard" targets which can be enabled
                my $wantedby = cat_("$::prefix/lib/systemd/system/$name.service") =~ /^WantedBy=(graphical|multi-user).target$/sm ? $1 : '';
                if ($wantedby) {
                    push @services, [ $name, 0 ];
                }
            }
        }
    }

    @services;
}

sub _legacy_services() {
    local $ENV{LANGUAGE} = 'C';
    my @services;
    my $has_systemd = has_systemd();
    if ($has_systemd) {
        # The system not using systemd but will be at next boot. This is
        # is typically the case in the installer. In this mode we must read
        # as much as is practicable from the native systemd unit files and
        # combine that with information from chkconfig regarding legacy sysvinit
        # scripts (which systemd will parse and include when running)
        log::explanations("Detected systemd installed. Using fake service+chkconfig introspection.");
        foreach (glob_("$::prefix/lib/systemd/system/*.service")) {
            my ($name) = m!([^/]*).service$!;

            # We only look at non-template, non-symlinked service files
            if (!(/.*\@\.service$/g) && ! -l $_) {
                # Limit ourselves to "standard" targets
                my $wantedby = cat_($_) =~ /^WantedBy=(graphical|multi-user).target$/sm ? $1 : '';
                if ($wantedby) {
                    # Exclude if enabled statically
                    # Note DO NOT use -e when testing for files that could
                    # be symbolic links as this will fail under a chroot
                    # setup where -e will fail if the symlink target does
                    # exist which is typically the case when viewed outside
                    # of the chroot.
                    if (!-l "$::prefix/lib/systemd/system/$wantedby.target.wants/$name.service") {
                        push @services, [ $name, !!-l "$::prefix/etc/systemd/system/$wantedby.target.wants/$name.service" ];
                    }
                }
            }
        }
    } else {
        log::explanations("Could not detect systemd. Using chkconfig service introspection.");
    }

    # Regardless of whether we expect to use systemd on next boot, we still
    # need to instrospect information about non-systemd native services.
    my $runlevel;
    my $on_off;
    if (!$::isInstall) {
        $runlevel = (split " ", `/sbin/runlevel`)[1];
    }
    foreach (run_program::rooted_get_stdout($::prefix, '/sbin/chkconfig', '--list', '--type', 'sysv')) {
        if (my ($name, $l) = m!^(\S+)\s+(0:(on|off).*)!) {
            # If we expect to use systemd (i.e. installer) only show those
            # sysvinit scripts which are not masked by a native systemd unit.
            my $has_systemd_unit = systemd_unit_exists($name);
            if (!$has_systemd || !$has_systemd_unit) {
                if ($::isInstall) {
                    $on_off = $l =~ /\d+:on/g;
                } else {
                    $on_off = $l =~ /$runlevel:on/g;
                }
                push @services, [ $name, $on_off ];
            }
        }
    }
    @services;
}

#- returns:
#--- the listref of installed services
#--- the listref of "on" services
sub services() {
    my @services;
    if (running_systemd()) {
        @services = _systemd_services();
    } else {
        @services = _legacy_services();
    }

    my @l = xinetd_services();
    push @l, @services;
    @l = sort { $a->[0] cmp $b->[0] } @l;
    [ map { $_->[0] } @l ], [ map { $_->[0] } grep { $_->[1] } @l ];
}



sub systemd_unit_exists {
    my ($name) = @_;
    # we test with -l as symlinks are not valid when the system is chrooted:
    -e "$::prefix/lib/systemd/system/$name.service" or -l "$::prefix/lib/systemd/system/$name.service";
}

sub service_exists {
    my ($service) = @_;
    -x "$::prefix/etc/rc.d/init.d/$service" or systemd_unit_exists($service);
}

sub restart ($) {
    my ($service) = @_;
    # Exit silently if the service is not installed
    service_exists($service) or return 1;
    _run_action($service, "restart");
}

sub restart_or_start ($) {
    my ($service) = @_;
    # Exit silently if the service is not installed
    service_exists($service) or return 1;
    _run_action($service, is_service_running($service) ? "restart" : "start");
}

sub start ($) {
    my ($service) = @_;
    # Exit silently if the service is not installed
    service_exists($service) or return 1;
    _run_action($service, "start");
}

sub start_not_running_service ($) {
    my ($service) = @_;
    # Exit silently if the service is not installed
    service_exists($service) or return 1;
    is_service_running($service) || _run_action($service, "start");
}

sub stop ($) {
    my ($service) = @_;
    # Exit silently if the service is not installed
    service_exists($service) or return 1;
    _run_action($service, "stop");
}

sub is_service_running ($) {
    my ($service) = @_;
    # Exit silently if the service is not installed
    service_exists($service) or return 1;
    if (running_systemd()) {
        run_program::rooted($::prefix, '/bin/systemctl', '--quiet', 'is-active', "$service.service");
    } else {
        run_program::rooted($::prefix, '/sbin/service', $service, 'status');
    }
}

sub starts_on_boot {
    my ($service) = @_;
    my (undef, $on_services) = services();
    member($service, @$on_services);
}

sub start_service_on_boot ($) {
    my ($service) = @_;
    _set_service($service, 1);
}

sub do_not_start_service_on_boot ($) {
    my ($service) = @_;
    _set_service($service, 0);
}

sub enable {
    my ($service, $o_dont_apply) = @_;
    start_service_on_boot($service);
    restart_or_start($service) unless $o_dont_apply;
}

sub disable {
    my ($service, $o_dont_apply) = @_;
    do_not_start_service_on_boot($service);
    stop($service) unless $o_dont_apply;
}

sub set_status {
    my ($service, $enable, $o_dont_apply) = @_;
    if ($enable) {
	enable($service, $o_dont_apply);
    } else {
	disable($service, $o_dont_apply);
    }
}

1;
Below are initial notes from Lars. Let's try to build on these in a usable way that we can hopefully nicely return.

Could we in docker have scripts to
- build kl exe from ext/sims copy of master at https://github.com/rcornwell/sims 
- make tops-20 boot disk
- boot tops-20 from disk

## Lars's notes

First order of business: what resources are there for TOPS-20AN?

Good search terms: tops20an, tops20-an, tops-20an, netwrk.mac, impdv.mac.

Good hunting grounds: bitsavers.org, pdp-10.trailing-edge.com

First get started running TOPS-20 V3A, V4, or V4.1. On KS10 or KL10. https://sky-visions.com/dec/tops20.shtml

Information
- http://bitsavers.org/pdf/dec/spd/22.02.02_7810_TOPS-20AN_3A.pdf
- https://www.rcsri.org/library/dec-pdp10/PDP10-Arpanet-Interface.pdf
- https://pdp-10.trailing-edge.com/mit_emacs_170_teco_1220/01/info/jsys.manual.html

Code
- https://pdp-10.trailing-edge.com/tapes/
- https://pdp-10.trailing-edge.com/BB-4171H-BM/ TOPS-20 v4.1 install works
- https://pdp-10.trailing-edge.com/BB-4170G-SM/ TOPS-20 release 3A monitor sources
- https://pdp-10.trailing-edge.com/BB-5254D-BM/ TOPS-20AN V4 installation tape
- https://pdp-10.trailing-edge.com/BB-5255D-BM/ TOPS-20AN V4 distribution tape 1/2 - love to use this on
- https://pdp-10.trailing-edge.com/BB-J711A-BM/ TOPS-20AN v4 distribution tape 2/2
- https://pdp-10.trailing-edge.com/BB-J712A-BM/ TOPS-20AN 2020 V4 installation tape
- https://pdp-10.trailing-edge.com/BB-J713A-BM/

## seeing files on the tape
    
    root@7a155138d900:/external/t20an# ../back10 -f ../t20v4/tapes/BB-5254D-BM.tap -T e11 -x xtbl09.cbl.1

    FROM ubuntu:24.04
    RUN apt-get update && apt-get install build-essential cmake telnet -y
    ADD external /external
    WORKDIR /external
    RUN gcc back10.c -o back10
    #root@5b7cbb97f071:/external# ./back10 -f ./t20v4/tapes/BB-5254D-BM.tap -T e11 -l
    #     9    4608 36 777700  5-Feb-1980 20:07:41 ps:<new-system>4-setspd.exe.1
    #   317  162304 36 777700 26-Feb-1980 17:06:34 ps:<new-system>an-monbig.exe.1
    #   317  162304 36 777700 26-Feb-1980 17:14:52 ps:<new-system>an-monlge.exe.1
    #   317  162304 36 777700 26-Feb-1980 16:56:30 ps:<new-system>an-monmed.exe.1
    #   317  162304 36 777700 26-Feb-1980 16:28:42 ps:<new-system>an-monsml.exe.1
    #    72  182171  7 777700 13-Feb-1980 20:27:50 ps:<new-system>bugs.mac.1
    #    11   25740  7 777700 26-Feb-1980 17:14:49 ps:<new-system>bugstrings.txt.1
    #    17    8704 36 777700  5-Feb-1980 18:28:38 ps:<new-system>checkd.exe.1
    #  1025  524800 36 777700  7-Feb-1980 20:09:06 ps:<new-system>dump.exe.1
    #    15    7251 36 777752  5-Feb-1980 18:49:55 ps:<new-system>errmes.bin.1
    #    82   41984 36 777752 30-Jan-1980 15:03:05 ps:<new-system>exec.exe.1
    #     9    4608 36 777700 14-Feb-1979 20:37:16 ps:<new-system>feddt.exe.1
    #    16    8192 36 777700  6-Feb-1980 17:49:10 ps:<new-system>ftpser.exe.1
    #     1      90  7 777700  7-Dec-1978 18:24:27 ps:<new-system>program-name-cache.txt.1
    #     1     333  7 777700  8-May-1979 13:51:09 ps:<new-system>ptycon.ato.1
    #     1     537  7 777700 22-Aug-1979 18:53:37 ps:<new-system>reaper.cmd.1
    #    27   68229  7 777700 14-Feb-1980 13:47:52 ps:<new-system>rsx20f.map.1
    #     7    3584 36 777700  5-Feb-1980 18:51:28 ps:<new-system>sysjob.exe.1
    #     3    5679  7 777700  2-Apr-1976 08:54:05 ps:<new-system>sysjob.hlp.1
    #     1     388  7 777700 22-Jan-1980 17:17:42 ps:<new-system>sysjob.run.1
    #     1     725  7 777700  8-May-1979 13:46:34 ps:<new-system>system.cmd.1
    #    26   13312 36 777700 13-Dec-1979 14:05:21 ps:<new-system>tgha.exe.1
    #     1     321  7 777700 18-Jun-1979 13:38:00 ps:<new-system>tgha.hlp.1
    #    12    6144 36 777752  5-Feb-1980 18:16:28 ps:<new-subsys>actgen.exe.1
    #     1     612  7 777752 11-Aug-1977 19:44:35 ps:<new-subsys>actgen.hlp.1
    #    16    8192 36 777752 29-Jan-1980 15:46:23 ps:<new-subsys>batcon.exe.1
    #    95   48640 36 777752  5-Feb-1980 22:46:18 ps:<new-subsys>blis10.exe.1
    #     2    3887  7 777752 12-Mar-1978 14:45:47 ps:<new-subsys>blis10.hlp.1
    #    23   11776 36 777752 29-Jan-1980 15:25:22 ps:<new-subsys>cdrive.exe.1
    #    17    8704 36 777752  5-Feb-1980 18:28:38 ps:<new-subsys>checkd.exe.1
    #     1     777  7 777752 24-Feb-1976 18:05:34 ps:<new-subsys>checkd.hlp.1
    #    10    5120 36 777752 21-Feb-1980 14:21:45 ps:<new-subsys>chkpnt.exe.1
    #     1    1103  7 777752  1-Aug-1977 18:43:32 ps:<new-subsys>chkpnt.hlp.1
    #     4    2048 36 777752  5-Feb-1980 18:20:49 ps:<new-subsys>cnvdsk.exe.1
    #     1     627  7 777752  1-Nov-1979 18:42:56 ps:<new-subsys>cnvdsk.hlp.1
    #    10    5120 36 777752  5-Feb-1980 18:23:24 ps:<new-subsys>cref.exe.1
    #     1    2032  7 777752  2-Apr-1976 08:46:15 ps:<new-subsys>cref.hlp.1
    #     7    3584 36 777752  5-Feb-1980 18:21:15 ps:<new-subsys>dluser.exe.1
    #     1     836  7 777752 24-Feb-1976 18:05:37 ps:<new-subsys>dluser.hlp.1
    #    31   15872 36 777752  5-Feb-1980 18:40:37 ps:<new-subsys>dumper.exe.1
    #     7   16222  7 777752  2-May-1979 12:32:00 ps:<new-subsys>dumper.hlp.1
    #     6    3072 36 777752  5-Feb-1980 18:23:25 ps:<new-subsys>dx20ld.exe.1
    #     4    1881 36 777752 10-Dec-1979 14:13:00 ps:<new-subsys>dxmca.adx.1
    #    25   12800 36 777752  5-Feb-1980 18:32:21 ps:<new-subsys>edit.exe.1
    #     4    7887  7 777752  9-Jun-1976 17:37:17 ps:<new-subsys>edit.hlp.1
    #     7    3584 36 777752  5-Feb-1980 18:39:27 ps:<new-subsys>fe.exe.1
    #     1     145  7 777752 29-Apr-1976 15:25:04 ps:<new-subsys>fe.hlp.1
    #     8    4096 36 777752  5-Feb-1980 20:04:25 ps:<new-subsys>filcom.exe.1
    #     1     700  7 777752 31-Jan-1979 14:50:59 ps:<new-subsys>filcom.hlp.1
    #    18    9216 36 777752 12-Dec-1979 17:45:53 ps:<new-subsys>filddt.exe.1
    #    13    6656 36 777752 12-Dec-1979 15:52:00 ps:<new-subsys>format.exe.1
    #     4    1638 36 777752  6-Dec-1977 00:29:59 ps:<new-subsys>format.hlp.1
    #    13    6656 36 777752  6-Feb-1980 17:48:34 ps:<new-subsys>ftp.exe.1
    #     1     570  7 777752  5-Oct-1977 06:45:59 ps:<new-subsys>ftp.hlp.1
    #     4    2048 36 777752  6-Feb-1980 17:49:21 ps:<new-subsys>ftsctl.exe.1
    #    31   15872 36 777752 23-Oct-1979 16:29:00 ps:<new-subsys>galgen.exe.1
    #     2     513 36 777752 29-Jan-1980 15:12:33 ps:<new-subsys>glxini.rel.1
    #    23   11776 36 777752 29-Jan-1980 15:44:00 ps:<new-subsys>glxlib.exe.1
    #    20   10040 36 777752 29-Jan-1980 15:11:55 ps:<new-subsys>glxmac.unv.1
    #     1     482  7 777752 23-Oct-1979 19:31:56 ps:<new-subsys>help.hlp.1
    #     5    2560 36 777752  5-Feb-1980 18:38:48 ps:<new-subsys>info.exe.1
    #    90   46080 36 777752 12-Dec-1979 22:32:59 ps:<new-subsys>link.exe.1
    #     7   17235  7 777752 30-Aug-1979 15:08:59 ps:<new-subsys>link.hlp.1
    #     1     256 18 777752 30-Mar-1976 09:10:43 ps:<new-subsys>lp64.ram.1
    #     1     256 18 777752 25-Mar-1976 12:55:46 ps:<new-subsys>lp96.ram.1
    #    30   15360 36 777752 29-Jan-1980 15:42:51 ps:<new-subsys>lptspl.exe.1
    #     1     416 36 777752  5-Feb-1980 18:24:03 ps:<new-subsys>macrel.rel.1
    #    35   17920 36 777752 12-Dec-1979 17:37:21 ps:<new-subsys>macro.exe.1
    #     1     679  7 777752  1-Sep-1976 12:48:41 ps:<new-subsys>macro.hlp.1
    #     8    3846 36 777752  5-Feb-1980 18:24:00 ps:<new-subsys>macsym.unv.1
    #     6    3072 36 777752  5-Feb-1980 18:27:09 ps:<new-subsys>mail.exe.1
    #     1    1536  7 777752 25-Jan-1976 13:47:41 ps:<new-subsys>mail.hlp.1
    #     6    3072 36 777752  5-Feb-1980 18:27:08 ps:<new-subsys>mailer.exe.1
    #     4    2048 36 777752  5-Feb-1980 18:26:16 ps:<new-subsys>makdmp.exe.1
    #    40   20480 36 777752 28-Jan-1980 18:54:50 ps:<new-subsys>maklib.exe.1
    #     1    2270  7 777752  7-Jul-1978 16:06:59 ps:<new-subsys>maklib.hlp.1
    #     5    2560 36 777752  5-Feb-1980 18:29:22 ps:<new-subsys>makram.exe.1
    #     2    3243  7 777752 21-Jul-1976 08:02:38 ps:<new-subsys>makram.hlp.1
    #     7    3584 36 777752  5-Feb-1980 18:29:13 ps:<new-subsys>makvfu.exe.1
    #     2    3845  7 777752  5-Aug-1976 13:41:28 ps:<new-subsys>makvfu.hlp.1
    #     3    1536 36 777752  5-Feb-1980 18:27:35 ps:<new-subsys>mapper.exe.1
    #    16    8030 36 777752  5-Feb-1980 18:33:52 ps:<new-subsys>monsym.rel.1
    #    43   21838 36 777752  5-Feb-1980 18:33:38 ps:<new-subsys>monsym.unv.1
    #    28   14336 36 777752 21-Feb-1980 14:34:16 ps:<new-subsys>mountr.exe.1
    #    20   10240 36 777752  6-Feb-1980 17:51:06 ps:<new-subsys>ms.exe.1
    #    10   24051  7 777752 13-Mar-1979 23:29:13 ps:<new-subsys>ms.hlp.1
    #     9    4608 36 777752  6-Feb-1980 17:52:01 ps:<new-subsys>netser.exe.1
    #    11    5632 36 777752  6-Feb-1980 17:53:54 ps:<new-subsys>netstat.exe.1
    #     1     554  7 777752  8-Jan-1977 00:59:01 ps:<new-subsys>netstat.hlp.1
    #     8    4096 36 777752  6-Feb-1980 17:53:25 ps:<new-subsys>nmailr.exe.1
    #     1      67 16 777752 21-Mar-1976 14:08:12 ps:<new-subsys>normal.vfu.1
    #    28   14336 36 777752  7-Mar-1980 17:32:25 ps:<new-subsys>opr.exe.1
    #     9    4269 36 777752 29-Oct-1979 21:31:31 ps:<new-subsys>opr.hlp.1
    #    44   22528 36 777752  7-Mar-1980 17:32:19 ps:<new-subsys>orion.exe.1
    #     6    2782 36 777752 15-Dec-1979 02:04:25 ps:<new-subsys>ovrlay.rel.1
    #    26   13312 36 777752  5-Feb-1980 18:45:47 ps:<new-subsys>pa1050.exe.1
    #    37   18944 36 777752  5-Feb-1980 18:45:44 ps:<new-subsys>pat.exe.1
    #    12    6144 36 777752 29-Jan-1980 15:16:14 ps:<new-subsys>please.exe.1
    #     2    3697  7 777752 13-Aug-1979 17:05:43 ps:<new-subsys>please.hlp.1
    #     9    4608 36 777752  5-Feb-1980 18:40:43 ps:<new-subsys>ptycon.exe.1
    #     1    1207  7 777752 24-Feb-1976 18:05:45 ps:<new-subsys>ptycon.hlp.1
    #     7    3584 36 777752 29-Jan-1980 15:17:14 ps:<new-subsys>qmangr.exe.1
    #    40   20480 36 777752 29-Jan-1980 15:52:29 ps:<new-subsys>quasar.exe.1
    #     6    3072 36 777752  5-Feb-1980 18:29:11 ps:<new-subsys>rdmail.exe.1
    #     1     637  7 777752 30-May-1979 14:17:58 ps:<new-subsys>rdmail.hlp.1
    #    12    6144 36 777752  5-Feb-1980 18:42:33 ps:<new-subsys>reaper.exe.1
    #     1    1302  7 777752 13-Dec-1979 17:05:17 ps:<new-subsys>reaper.hlp.1
    #     7    3584 36 777752  5-Feb-1980 18:32:31 ps:<new-subsys>rsxfmt.exe.1
    #     2    2861  7 777752 16-Jun-1978 12:45:20 ps:<new-subsys>rsxfmt.hlp.1
    #     3    6625  7 777752  6-Aug-1976 08:23:09 ps:<new-subsys>runinp.hlp.1
    #    33   16896 36 777752  5-Feb-1980 20:13:10 ps:<new-subsys>runoff.exe.1
    #     2    4695  7 777752 10-Sep-1976 10:29:13 ps:<new-subsys>runoff.hlp.1
    #    27   13824 36 777752 12-Dec-1979 17:45:48 ps:<new-subsys>sddt.exe.1
    #    13    6656 36 777752  6-Feb-1980 17:54:06 ps:<new-subsys>sndmsg.exe.1
    #     1    1944  7 777752  1-Nov-1977 17:17:53 ps:<new-subsys>sndmsg.hlp.1
    #    16    8192 36 777752 29-Jan-1980 15:46:30 ps:<new-subsys>sprint.exe.1
    #    13    6656 36 777752 29-Jan-1980 15:18:58 ps:<new-subsys>sprout.exe.1
    #    50   25600 36 777752  6-Feb-1980 20:01:53 ps:<new-subsys>sysera.exe.1
    #    60   30720 36 777752  6-Feb-1980 20:02:00 ps:<new-subsys>syserb.exe.1
    #    49   25088 36 777752  6-Feb-1980 20:02:06 ps:<new-subsys>syserc.exe.1
    #    46   23552 36 777752  6-Feb-1980 20:02:12 ps:<new-subsys>syserd.exe.1
    #    43   22016 36 777752  6-Feb-1980 20:02:17 ps:<new-subsys>syserk.exe.1
    #    41   20992 36 777752  6-Feb-1980 20:02:22 ps:<new-subsys>sysern.exe.1
    #    40   20480 36 777752  6-Feb-1980 20:01:47 ps:<new-subsys>syserr.exe.1
    #     2    4356  7 777752 11-Dec-1979 19:18:07 ps:<new-subsys>syserr.hlp.1
    #    45   23040 36 777752  6-Feb-1980 20:02:28 ps:<new-subsys>sysers.exe.1
    #     1    1217  7 777752 18-Sep-1979 01:03:49 ps:<new-subsys>systap.ctl.1
    #    12    6144 36 777752  6-Feb-1980 17:54:01 ps:<new-subsys>telnet.exe.1
    #     1     711  7 777752  7-Jan-1977 18:32:15 ps:<new-subsys>telnet.hlp.1
    #    23   11776 36 777752  5-Feb-1980 18:54:05 ps:<new-subsys>tv.exe.1
    #    11    5632 36 777752 12-Dec-1979 17:45:23 ps:<new-subsys>uddt.exe.1
    #     9    4608 36 777752  5-Feb-1980 18:48:53 ps:<new-subsys>ulist.exe.1
    #     1     731  7 777752 24-Feb-1976 18:05:49 ps:<new-subsys>ulist.hlp.1
    #   103   52736 36 777752  5-Feb-1980 22:55:15 ps:<new-subsys>usag20.exe.1
    #     1     154 36 777752  3-Oct-1977 15:07:35 ps:<new-subsys>usag20.hlp.1
    #   100   51200 36 777752  5-Feb-1980 22:57:19 ps:<new-subsys>usah20.exe.1
    #     1     770  7 777752  2-Dec-1977 14:51:09 ps:<new-subsys>usah20.hlp.1
    #     8    4096 36 777752  5-Feb-1980 18:44:58 ps:<new-subsys>verify.exe.1
    #    21   10752 36 777752 14-Feb-1980 15:31:52 ps:<new-subsys>watch.exe.1
    #     3    5327  7 777752 13-Feb-1980 13:26:00 ps:<new-subsys>watch.hlp.1
    #     2    3834  7 777740 21-Aug-1978 20:06:59 ps:<uetp.lib>467.for.1
    #     2    3581  7 777740  1-Dec-1977 23:25:03 ps:<uetp.lib>adpr12.alg.1
    #     1     284 36 777740  1-Dec-1977 23:32:12 ps:<uetp.lib>adpr12.com.1
    #     2    2615  7 777740 22-Oct-1979 05:09:52 ps:<uetp.lib>algol.ver.1
    #     1    2097  7 777740 22-Oct-1979 05:10:35 ps:<uetp.lib>apl.ver.1
    #     1    2090  7 777740 22-Oct-1979 05:10:56 ps:<uetp.lib>aplsf.ver.1
    #     1    1875  7 777740 21-Feb-1979 20:52:49 ps:<uetp.lib>basic.ver.1
    #     2    4604  7 777740 17-Aug-1978 15:19:52 ps:<uetp.lib>batch.cbl.1
    #     1      31  7 777740 17-Aug-1978 16:05:17 ps:<uetp.lib>batch.cmd.1
    #    95   48640 36 777740 10-Jan-1980 21:48:40 ps:<uetp.lib>cblsrt.exe.1
    #     2    2575  7 777740 22-Oct-1979 05:11:07 ps:<uetp.lib>cblsrt.ver.1
    #     1     364  7 777740 16-Oct-1979 01:15:52 ps:<uetp.lib>clean-up.cmd.1
    #     1    2391  7 777740  3-May-1979 20:02:04 ps:<uetp.lib>cobold.app.1
    #    20   10240 36 777740 18-Oct-1979 13:23:23 ps:<uetp.lib>d60spd.exe.1
    #     1      50  7 777740 10-Nov-1977 18:08:44 ps:<uetp.lib>dbms.txt.1
    #     5   11722  7 777740  3-May-1979 20:14:53 ps:<uetp.lib>dbms.ver.1
    #    13    6522 36 777740 23-Nov-1977 14:53:34 ps:<uetp.lib>depre.apl.1
    #     1    1895  7 777740 16-Oct-1979 18:48:07 ps:<uetp.lib>dn22r.ver.1
    #     1    1268  7 777740 16-Oct-1979 18:49:44 ps:<uetp.lib>dn22ra.send.1
    #     1    1836  7 777740 17-Oct-1979 15:30:16 ps:<uetp.lib>dn22s.ver.1
    #     1    1268  7 777740 17-Oct-1979 15:30:27 ps:<uetp.lib>dn22sa.send.1
    #    40   99964  7 777740 26-Oct-1977 15:17:03 ps:<uetp.lib>dn64.dat.1
    #     1    1894  7 777740  3-May-1979 04:43:57 ps:<uetp.lib>dn64a.ver.1
    #     1    1799  7 777740  3-May-1979 04:44:08 ps:<uetp.lib>dn64b.ver.1
    #     1    1739  7 777740  3-May-1979 04:44:41 ps:<uetp.lib>dn64c.ver.1
    #     1    1893  7 777740  3-May-1979 04:48:22 ps:<uetp.lib>dn64l.ver.1
    #     1    1798  7 777740  3-May-1979 04:48:35 ps:<uetp.lib>dn64m.ver.1
    #     1    1797  7 777740  3-May-1979 04:49:06 ps:<uetp.lib>dn64n.ver.1
    #     1    1268  7 777740  3-May-1979 20:48:19 ps:<uetp.lib>dn64sa.send.1
    #     1    1250  7 777740  3-May-1979 20:48:30 ps:<uetp.lib>dn64sb.send.1
    #     1    1245  7 777740  3-May-1979 20:48:49 ps:<uetp.lib>dn64sc.send.1
    #     1    1268  7 777740  3-May-1979 20:49:00 ps:<uetp.lib>dn64sl.send.1
    #     1    1250  7 777740  3-May-1979 20:49:09 ps:<uetp.lib>dn64sm.send.1
    #     1    1245  7 777740  3-May-1979 20:49:17 ps:<uetp.lib>dn64sn.send.1
    #     1    1897  7 777740  2-Dec-1977 21:41:26 ps:<uetp.lib>factor.basic.1
    #     1    1040  7 777740  2-Apr-1965 16:24:00 ps:<uetp.lib>fit2.fml.1
    #     2    2699  7 777740 22-Oct-1979 07:23:49 ps:<uetp.lib>fortra.app.1
    #     6    2840 36 777740  5-Jul-1978 14:39:05 ps:<uetp.lib>libary.lib.1
    #     3    5601  7 777740 22-Oct-1979 07:06:36 ps:<uetp.lib>mta0.cmp.1
    #     2    4494  7 777740  5-Nov-1979 04:42:00 ps:<uetp.lib>mta0.ver.1
    #     3    5601  7 777740 22-Oct-1979 07:06:44 ps:<uetp.lib>mta1.cmp.1
    #     2    4494  7 777740  5-Nov-1979 04:42:10 ps:<uetp.lib>mta1.ver.1
    #     3    5601  7 777740 22-Oct-1979 07:06:49 ps:<uetp.lib>mta2.cmp.1
    #     2    4494  7 777740  5-Nov-1979 04:42:17 ps:<uetp.lib>mta2.ver.1
    #     3    5601  7 777740 22-Oct-1979 07:06:59 ps:<uetp.lib>mta3.cmp.1
    #     2    4494  7 777740  5-Nov-1979 04:42:25 ps:<uetp.lib>mta3.ver.1
    #     3    5601  7 777740 22-Oct-1979 07:07:09 ps:<uetp.lib>mta4.cmp.1
    #     2    4494  7 777740  5-Nov-1979 04:42:34 ps:<uetp.lib>mta4.ver.1
    #     3    5601  7 777740 22-Oct-1979 07:07:15 ps:<uetp.lib>mta5.cmp.1
    #     2    4494  7 777740  5-Nov-1979 04:42:41 ps:<uetp.lib>mta5.ver.1
    #     3    5601  7 777740 22-Oct-1979 07:07:20 ps:<uetp.lib>mta6.cmp.1
    #     2    4494  7 777740  5-Nov-1979 04:42:47 ps:<uetp.lib>mta6.ver.1
    #     3    5601  7 777740 22-Oct-1979 07:07:28 ps:<uetp.lib>mta7.cmp.1
    #     2    4494  7 777740  5-Nov-1979 04:42:57 ps:<uetp.lib>mta7.ver.1
    #    59   30208 36 777740 10-Jan-1980 21:43:10 ps:<uetp.lib>mtabak.exe.1
    #     2    3106  7 777740  1-Mar-1979 02:31:52 ps:<uetp.lib>mtabak.for.1
    #    61   31232 36 777740 10-Jan-1980 21:44:49 ps:<uetp.lib>mtabkr.exe.1
    #     2    4689  7 777740  1-Mar-1979 02:32:05 ps:<uetp.lib>mtabkr.for.1
    #    59   30208 36 777740 10-Jan-1980 21:44:17 ps:<uetp.lib>mtaskf.exe.1
    #     2    3217  7 777740  1-Mar-1979 03:39:00 ps:<uetp.lib>mtaskf.for.1
    #    59   30208 36 777740 10-Jan-1980 21:43:31 ps:<uetp.lib>mtaskr.exe.1
    #     2    3350  7 777740  1-Mar-1979 02:32:36 ps:<uetp.lib>mtaskr.for.1
    #     6   13076  7 777740 17-Aug-1978 15:19:18 ps:<uetp.lib>online.cbl.1
    #     1      33  7 777740 17-Aug-1978 17:21:45 ps:<uetp.lib>online.cmd.1
    #     7   17705  7 777740  8-Apr-1965 19:47:00 ps:<uetp.lib>ordent.cbl.1
    #     2    4660  7 777740  2-Apr-1965 11:59:00 ps:<uetp.lib>ordent.ddl.1
    #     2    4155  7 777740 23-Feb-1965 19:17:59 ps:<uetp.lib>ordtin.ddl.1
    #     2    3198  7 777740 21-Jun-1978 18:54:33 ps:<uetp.lib>pbload.cbl.1
    #     4    9430  7 777740 17-Aug-1978 17:31:05 ps:<uetp.lib>pbload.fil.1
    #     4    8763  7 777740 17-Aug-1978 17:24:48 ps:<uetp.lib>pbrpt.cbl.1
    #     1    2078  7 777740 10-Jan-1980 21:42:00 ps:<uetp.lib>prep.ctl.1
    #     4    1676 36 777740 10-Jan-1980 21:42:52 ps:<uetp.lib>prep.log.1
    #     2    3735  7 777740  2-Nov-1977 14:29:47 ps:<uetp.lib>rancbl.cbl.1
    #    69   35328 36 777740 10-Jan-1980 21:47:44 ps:<uetp.lib>rancbl.exe.1
    #     2    3188  7 777740 21-Oct-1979 21:09:23 ps:<uetp.lib>rancbl.ver.1
    #    59   30208 36 777740 10-Jan-1980 21:45:44 ps:<uetp.lib>ranfor.exe.1
    #     2    2627  7 777740  2-Dec-1977 19:47:19 ps:<uetp.lib>ranfor.for.1
    #     1    2337  7 777740 30-Jul-1979 14:49:36 ps:<uetp.lib>ranfor.ver.1
    #     1      69  7 777740 25-Aug-1978 21:57:26 ps:<uetp.lib>report.cmd.1
    #    15    7680 36 777740 10-Jan-1980 21:57:14 ps:<uetp.lib>sender.exe.1
    #     7    3414 36 777740 10-Jan-1980 21:55:21 ps:<uetp.lib>sender.rel.1
    #     1    1163  7 777740 16-Oct-1979 01:15:45 ps:<uetp.lib>set-up.cmd.1
    #    40   99964  7 777740 26-Oct-1977 15:17:03 ps:<uetp.lib>snda.dat.1
    #     1    1902  7 777740 21-Oct-1979 22:54:38 ps:<uetp.lib>sort.app.1
    #   143  365730  7 777740  3-Aug-1978 18:28:04 ps:<uetp.lib>sort.dat.1
    #   143  365730  7 777740  3-Aug-1978 16:42:16 ps:<uetp.lib>sort.inp.1
    #     2    3779  7 777740  4-Jul-1978 07:05:53 ps:<uetp.lib>spdave.ddl.1
    #     2    1024 36 777740 17-Aug-1978 18:16:55 ps:<uetp.lib>spdave.gd.1
    #    15   37179  7 777740  4-Jul-1978 07:08:40 ps:<uetp.lib>spdbms.cbl.1
    #     1      21  7 777740 21-Feb-1979 20:12:06 ps:<uetp.lib>sys.cmd.1
    #   176   90002 36 777740  9-Aug-1978 06:30:49 ps:<uetp.lib>t467.da1.1
    #   176   90002 36 777740  3-Aug-1978 00:53:15 ps:<uetp.lib>t467.dat.1
    #     1    1152  7 777740  3-Aug-1978 16:35:10 ps:<uetp.lib>t467.for.1
    #     7   15921  7 777740 16-Nov-1977 17:14:33 ps:<uetp.lib>tapops.mac.1
    #    62   31744 36 777740 10-Jan-1980 21:46:34 ps:<uetp.lib>tapred.exe.1
    #     2    2697  7 777740 28-Feb-1979 15:43:29 ps:<uetp.lib>tapred.for.1
    #    62   31744 36 777740 10-Jan-1980 21:47:01 ps:<uetp.lib>tapwrt.exe.1
    #     1    2144  7 777740 28-Feb-1979 15:43:53 ps:<uetp.lib>tapwrt.for.1
    #     3    5234  7 777740  6-Jun-1980 15:04:47 ps:<uetp.lib>tops20.verify.1
    #     1     490  7 777740 26-Apr-1976 11:19:59 ps:<uetp.lib>tstidb.cbl.1
    #    63  159165  7 777740 26-Mar-1976 18:05:59 ps:<uetp.lib>tstidb.ddl.1
    #    62   31744 36 777740 10-Jan-1980 21:47:21 ps:<uetp.lib>uetcmp.exe.1
    #     4    9528  7 777740 30-May-1978 20:10:29 ps:<uetp.lib>uetcmp.for.1
    #     5    2390 36 777740 10-Jan-1980 21:57:20 ps:<uetp.lib>uetcmp.rel.1
    #     1     812  7 777740 22-Oct-1979 07:30:31 ps:<uetp.lib>uetp.cmd.1
    #     1    1458  7 777740  3-Nov-1979 04:57:29 ps:<uetp.lib>uetp.ctl.1
    #    26   13312 36 777740 10-Jan-1980 21:55:15 ps:<uetp.lib>uetp.exe.1
    #     2     897 36 777740 10-Jan-1980 21:48:59 ps:<uetp.lib>uetp.log.1
    #    18    9195 36 777740 10-Jan-1980 21:49:03 ps:<uetp.lib>uetp.rel.1
    #     1    1130  7 777740 23-Feb-1976 12:41:59 ps:<uetp.lib>unv4.fml.1
    #     1    1510  7 777740 15-Apr-1976 14:37:59 ps:<uetp.lib>v4.fml.1
    #     1    1780  7 777740 12-May-1976 13:23:01 ps:<uetp.lib>v4b.ddl.1
    #     1    1255  7 777740 15-Nov-1977 15:47:04 ps:<uetp.lib>v4b.fml.1
    #     1    1808  7 777740 30-Jul-1979 19:09:28 ps:<uetp.lib>v4s.ddl.1
    #     1    1105  7 777740  9-Apr-1976 14:37:59 ps:<uetp.lib>v4s.fml.1
    #     1     801  7 777740  4-May-1979 14:25:39 ps:<uetp.lib>verify.cmd.1
    #     1    1508  7 777740 30-Jul-1979 00:17:35 ps:<uetp.lib>verify.ver.1
    #     9    4201 36 777740 17-Nov-1977 17:57:43 ps:<uetp.lib>xtbl09.cbl.1
    #     2     894 36 777740 17-Nov-1977 17:57:48 ps:<uetp.lib>xtbl9s.cbl.1
    #root@5b7cbb97f071:/external# 

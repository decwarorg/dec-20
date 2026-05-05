 what happened so far

- step1-create-dskan.ini was able to boot from tape BB-5254D-BM.tap and create an empty dskan for experiments.
- step2-restore-system.ini was able to use dumper to restore ps:<system> and ps:<subsys> from tape BB-5254D-BM.tap to dskan. this is more than it sounds like, as this tape seems to have issues? we're lucky to get clean restores of both directories.
- step3-now-see-what-happens.ini was experiments with dskan. it seems to have issues. we can't get out of mx> and into the normal commmand processor. show stopper.
- step4-boot-v41-tape-but-with-dskan.ini this gives us a command processor with which to operate on dskan. this lets us use dumper to create our own standard simh format tape bb-t20an-v4.tap that seems to work ok.


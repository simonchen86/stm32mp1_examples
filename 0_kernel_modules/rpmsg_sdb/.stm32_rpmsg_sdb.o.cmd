cmd_/home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/stm32_rpmsg_sdb.o := arm-ostl-linux-gnueabi-gcc -Wp,-MD,/home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/.stm32_rpmsg_sdb.o.d  -nostdinc -isystem /home/simon/workspace/st/developer_package/sdk/v2.1.0/sysroots/x86_64-ostl_sdk-linux/usr/lib/arm-ostl-linux-gnueabi/gcc/arm-ostl-linux-gnueabi/9.3.0/include -I/home/simon/workspace/st/developer_package/linux/sources/arch/arm/include -I./arch/arm/include/generated -I/home/simon/workspace/st/developer_package/linux/sources/include -I./include -I/home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/home/simon/workspace/st/developer_package/linux/sources/include/uapi -I./include/generated/uapi -include /home/simon/workspace/st/developer_package/linux/sources/include/linux/kconfig.h -include /home/simon/workspace/st/developer_package/linux/sources/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp -funwind-tables -marm -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fstack-protector-strong -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-variable -fomit-frame-pointer -fno-var-tracking-assignments -g -fno-inline-functions-called-once -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -fmacro-prefix-map=/home/simon/workspace/st/developer_package/linux/sources/= -Wno-packed-not-aligned --sysroot=/home/simon/workspace/st/developer_package/sdk/v2.1.0/sysroots/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi  -DMODULE  -DKBUILD_BASENAME='"stm32_rpmsg_sdb"' -DKBUILD_MODNAME='"stm32_rpmsg_sdb"' -c -o /home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/stm32_rpmsg_sdb.o /home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/stm32_rpmsg_sdb.c

source_/home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/stm32_rpmsg_sdb.o := /home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/stm32_rpmsg_sdb.c

deps_/home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/stm32_rpmsg_sdb.o := \
    $(wildcard include/config/cma/alignment.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kconfig.h \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/cc/has/asm/inline.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/compiler_attributes.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/compiler-gcc.h \
    $(wildcard include/config/retpoline.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/bpf/events.h) \
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/types.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/types.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/int-ll64.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/uapi/asm/bitsperlong.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitsperlong.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/bitsperlong.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/posix_types.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/stddef.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/stddef.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/compiler_types.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/posix_types.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/posix_types.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/const.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/const.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
  /home/simon/workspace/st/developer_package/sdk/v2.1.0/sysroots/x86_64-ostl_sdk-linux/usr/lib/arm-ostl-linux-gnueabi/gcc/arm-ostl-linux-gnueabi/9.3.0/include/stdarg.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/limits.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/limits.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/linkage.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/stringify.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/export.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/have/arch/prel32/relocations.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/linkage.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/cpu/spectre.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/barrier.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kasan-checks.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/bitops.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/bits.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/bitops.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/typecheck.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/cpu/v7m.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/hwcap.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/hwcap.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/irqflags.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/non-atomic.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/builtin-__fls.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/builtin-__ffs.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/builtin-fls.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/builtin-ffs.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/ffz.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/fls64.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/sched.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/hweight.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/arch_hweight.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/const_hweight.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/lock.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/atomic.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
    $(wildcard include/config/arm/lpae.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/prefetch.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/binfmt/elf/fdpic.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/hw_breakpoint.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/unified.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/cmpxchg-local.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/atomic-fallback.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/atomic-long.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/le.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/byteorder.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/byteorder/little_endian.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/byteorder/little_endian.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/swab.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/swab.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/swab.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/swab.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/byteorder/generic.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/quiet.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kern_levels.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/kernel.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/sysinfo.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/dynamic_debug.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/build_bug.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/div64.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/compiler.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/div64.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/stat.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/stat.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/stat.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/preemption.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/arm/include/generated/asm/preempt.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/preempt.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/bug.h \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/restart_block.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/time64.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/time.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/time_types.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/stackprotector/per/task.h) \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/glue.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/pgtable-2level-types.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/xip/phys/addr.h) \
    $(wildcard include/config/debug/virtual.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/sizes.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/pfn.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/getorder.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/bottom_half.h \
  arch/arm/include/generated/asm/mmiowb.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/mmiowb.h \
    $(wildcard include/config/mmiowb.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/spinlock_types.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/spinlock_types.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rwlock_types.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/spinlock.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rwlock.h \
    $(wildcard include/config/preempt.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/time32.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/timex.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/timex.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/param.h \
  arch/arm/include/generated/uapi/asm/param.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/param.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/timex.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/highuid.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kmod.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/umh.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/contig/alloc.h) \
    $(wildcard include/config/cma.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/shuffle/page/allocator.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/wait.h \
  arch/arm/include/generated/asm/current.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/current.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/wait.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/nodemask.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/bitmap.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/string.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/string.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/page-flags-layout.h \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/kasan/sw/tags.h) \
  include/generated/bounds.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/mm_types.h \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/mm_types_task.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/auxvec.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/auxvec.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/auxvec.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/auxvec.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rbtree.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rcutree.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/debug/rwsems.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/err.h \
  arch/arm/include/generated/uapi/asm/errno.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/errno.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/errno-base.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/osq_lock.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/completion.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/uprobes.h \
    $(wildcard include/config/uprobes.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/errno.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/errno.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/uprobes.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/probes.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/preempt/rt.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/ktime.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/jiffies.h \
  include/generated/timeconst.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/timekeeping.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/timekeeping32.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
    $(wildcard include/config/vdso.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/idle/page/tracking.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/notifier.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/debug/mutexes.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rcu_segcblist.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/srcutree.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/arch_topology.h \
    $(wildcard include/config/generic/arch/topology.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/smp.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/percpu.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/percpu.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/topology.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/sysctl.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/elf.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/elf.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/vdso_datapage.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/user.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/elf.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/elf-em.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/sysfs.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/idr.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/radix-tree.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/xarray.h \
    $(wildcard include/config/xarray/multi.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kconfig.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kobject_ns.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kref.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/jump_label.h \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rbtree_latch.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/error-injection.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/error-injection.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/tracepoint-defs.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/static_key.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
    $(wildcard include/config/arm/module/plts.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rpmsg.h \
    $(wildcard include/config/rpmsg.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/device.h \
    $(wildcard include/config/acpi.h) \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/declare/coherent.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/arch/has/sync/dma/for/device.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu/all.h) \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/ioport.h \
    $(wildcard include/config/io/strict/devmem.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/klist.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/hrtimer_defs.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/timerqueue.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/ratelimit.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/sched.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/uclamp/task.h) \
    $(wildcard include/config/uclamp/buckets/count.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/psi.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/posix/cputimers.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/x86/cpu/resctrl.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/rseq.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/gcc/plugin/stackleak.h) \
    $(wildcard include/config/arch/task/struct/on/stack.h) \
    $(wildcard include/config/debug/rseq.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/sched.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/pid.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rculist.h \
    $(wildcard include/config/prove/rcu/list.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/sem.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/sem.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/ipc.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rhashtable-types.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/ipc.h \
  arch/arm/include/generated/uapi/asm/ipcbuf.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/ipcbuf.h \
  arch/arm/include/generated/uapi/asm/sembuf.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/sembuf.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/shm.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/shm.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm/include/generated/uapi/asm/shmbuf.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/shmbuf.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/shmparam.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kcov.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/kcov.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/plist.h \
    $(wildcard include/config/debug/plist.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/seccomp.h \
  arch/arm/include/generated/asm/seccomp.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/seccomp.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/unistd.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/oabi/compat.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/unistd.h \
  arch/arm/include/generated/uapi/asm/unistd-eabi.h \
  arch/arm/include/generated/uapi/asm/unistd-common.h \
  arch/arm/include/generated/asm/unistd-nr.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/resource.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/resource.h \
  arch/arm/include/generated/uapi/asm/resource.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/resource.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/resource.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/latencytop.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/sched/prio.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/sched/types.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/signal.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/signal.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/signal.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/signal-defs.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/sigcontext.h \
  arch/arm/include/generated/uapi/asm/siginfo.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/siginfo.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/posix-timers.h \
    $(wildcard include/config/posix/timers.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/alarmtimer.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/rseq.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/overflow.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/device.h \
    $(wildcard include/config/dmabounce.h) \
    $(wildcard include/config/iommu/api.h) \
    $(wildcard include/config/arm/dma/use/iommu.h) \
    $(wildcard include/config/arch/omap.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/pm_wakeup.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/mod_devicetable.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/uuid.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/uuid.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/poll.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/fs.h \
    $(wildcard include/config/read/only/thp/for/fs.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/fs/verity.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/migration.h) \
    $(wildcard include/config/io/uring.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/wait_bit.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kdev_t.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/kdev_t.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/dcache.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rculist_bl.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/list_bl.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/bit_spinlock.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/path.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/list_lru.h \
    $(wildcard include/config/memcg/kmem.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/shrinker.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/capability.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/capability.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/semaphore.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/fcntl.h \
    $(wildcard include/config/arch/32bit/off/t.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/fcntl.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/uapi/asm/fcntl.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/fcntl.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/fiemap.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/migrate_mode.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/percpu-rwsem.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rcuwait.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/rcu_sync.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/delayed_call.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/errseq.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/ioprio.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/sched/rt.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/iocontext.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/fs_types.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/fs.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/ioctl.h \
  arch/arm/include/generated/uapi/asm/ioctl.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/ioctl.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/ioctl.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/percpu_counter.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/dqblk_xfs.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/dqblk_v1.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/dqblk_v2.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/dqblk_qtree.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/projid.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/quota.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/nfs_fs_i.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/uaccess.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/uaccess.h \
    $(wildcard include/config/cpu/sw/domain/pan.h) \
    $(wildcard include/config/cpu/use/domains.h) \
    $(wildcard include/config/uaccess/with/memcpy.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/cp15/mmu.h) \
  arch/arm/include/generated/asm/extable.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/extable.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/poll.h \
  arch/arm/include/generated/uapi/asm/poll.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/asm-generic/poll.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/eventpoll.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/percpu-refcount.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/kasan.h \
    $(wildcard include/config/kasan/generic.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/mm.h \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/arch/has/pkeys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/sparc64.h) \
    $(wildcard include/config/x86/intel/mpx.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/arch/has/pte/devmap.h) \
    $(wildcard include/config/dev/pagemap/ops.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/pci/p2pdma.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/init/on/alloc/default/on.h) \
    $(wildcard include/config/init/on/free/default/on.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/arch/has/set/direct/map.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/range.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/page_ext.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/arch/stackwalk.h) \
    $(wildcard include/config/have/reliable/stacktrace.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/stackdepot.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/memremap.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/pgtable.h \
    $(wildcard include/config/highpte.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/proc-fns.h \
    $(wildcard include/config/big/little.h) \
    $(wildcard include/config/harden/branch/predictor.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/glue-proc.h \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/v6k.h) \
    $(wildcard include/config/cpu/pj4b.h) \
    $(wildcard include/config/cpu/v7.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/pgtable-nopud.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/pgtable-nop4d-hack.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/5level-fixup.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/pgtable-hwdef.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/pgtable-2level-hwdef.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/tlbflush.h \
    $(wildcard include/config/smp/on/up.h) \
    $(wildcard include/config/cpu/tlb/v4wt.h) \
    $(wildcard include/config/cpu/tlb/fa.h) \
    $(wildcard include/config/cpu/tlb/v4wbi.h) \
    $(wildcard include/config/cpu/tlb/feroceon.h) \
    $(wildcard include/config/cpu/tlb/v4wb.h) \
    $(wildcard include/config/cpu/tlb/v6.h) \
    $(wildcard include/config/cpu/tlb/v7.h) \
    $(wildcard include/config/arm/errata/720789.h) \
    $(wildcard include/config/arm/errata/798181.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/pgtable-2level.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/pgtable.h \
    $(wildcard include/config/pgtable/levels.h) \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/x86/espfix64.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/huge_mm.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/dma-mapping.h \
    $(wildcard include/config/swiotlb.h) \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/arch/has/setup/dma/ops.h) \
    $(wildcard include/config/arch/has/teardown/dma/ops.h) \
    $(wildcard include/config/need/dma/map/state.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/dma-debug.h \
    $(wildcard include/config/dma/api/debug.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/dma-direction.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/scatterlist.h \
    $(wildcard include/config/need/sg/dma/length.h) \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/sgl/alloc.h) \
    $(wildcard include/config/arch/no/sg/chain.h) \
    $(wildcard include/config/sg/pool.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/io.h \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/need/mach/io/h.h) \
    $(wildcard include/config/pcmcia/soc/common.h) \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/pccard.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/logic_pio.h \
    $(wildcard include/config/indirect/pio.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/fwnode.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/vmalloc.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/mem_encrypt.h \
    $(wildcard include/config/arch/has/mem/encrypt.h) \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/dma-mapping.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/xen/xen.h \
    $(wildcard include/config/xen.h) \
    $(wildcard include/config/xen/pvh.h) \
    $(wildcard include/config/xen/dom0.h) \
    $(wildcard include/config/xen/balloon.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/xen/interface/hvm/start_info.h \
  /home/simon/workspace/st/developer_package/linux/sources/arch/arm/include/asm/xen/hypervisor.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/xen/arm/hypervisor.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/miscdevice.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/uapi/linux/major.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/eventfd.h \
    $(wildcard include/config/eventfd.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/of_platform.h \
    $(wildcard include/config/of/address.h) \
    $(wildcard include/config/of/dynamic.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/of_device.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/cpu.h \
    $(wildcard include/config/pm/sleep/smp.h) \
    $(wildcard include/config/pm/sleep/smp/nonzero/cpu.h) \
    $(wildcard include/config/hotplug/smt.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/node.h \
    $(wildcard include/config/hmem/reporting.h) \
    $(wildcard include/config/memory/hotplug/sparse.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/cpuhotplug.h \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/platform_device.h \
    $(wildcard include/config/suspend.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/of.h \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/promtree.h) \
    $(wildcard include/config/of/kobj.h) \
    $(wildcard include/config/of/numa.h) \
    $(wildcard include/config/of/overlay.h) \
  /home/simon/workspace/st/developer_package/linux/sources/include/linux/property.h \

/home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/stm32_rpmsg_sdb.o: $(deps_/home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/stm32_rpmsg_sdb.o)

$(deps_/home/simon/workspace/st/developer_package/examples/modules/rpmsg_sdb/stm32_rpmsg_sdb.o):

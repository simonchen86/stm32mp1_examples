/*******************************************************************
 *
 * Device tree settting:
 *     myirq_device {
 *         compatible = "st,myirq";
 *         status = "okay";
 *         interrupt-parent= <&gpioa>;
 *         interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
 *     };
 *
 *******************************************************************/

#include <asm/io.h>
#include <linux/io.h>
#include <linux/module.h>
#include <linux/of_device.h>
#include <linux/kernel.h>
#include <linux/delay.h>
#include <linux/gpio/consumer.h>
#include <linux/platform_device.h>
#include <linux/interrupt.h>

static int myirq_irq;
static irqreturn_t myirq_handler(int irq, void *dev);


static irqreturn_t myirq_handler(int irq, void *dev)
{
	printk("myirq handler!\n");
	return IRQ_HANDLED;
}

static int myirq_init_probe(struct platform_device *pdev)
{
	int i = 0, ret;
	int irq;

	printk("GPIO IRQ init\n");

	irq = platform_get_irq(pdev, 0);
	if (irq < 0) {
		printk("Could not get irq!\n");
		return irq;
	}

	printk("GPIO IRQ: %d\n", irq);
	myirq_irq = irq;
	ret = request_irq(irq, myirq_handler, IRQF_TRIGGER_LOW | IRQF_ONESHOT, "myirq", NULL);

	return 0;
}

static int myirq_exit_remove(struct platform_device * pdev)
{
	printk("GPIO IRQ exit\n");
	free_irq(myirq_irq, NULL);

	return 0;
}

static struct of_device_id myirq_match[] = {
	{.compatible = "st,myirq"},
	{/* end node */}
};

static struct platform_driver mygpio_driver = {
	.probe = myirq_init_probe,
	.remove = myirq_exit_remove,
	.driver = {
		.name = "myirq_driver",
		.owner = THIS_MODULE,
		.of_match_table = myirq_match,
	}
};

module_platform_driver(mygpio_driver);

MODULE_AUTHOR("Simon Chen");
MODULE_DESCRIPTION("GPIO IRQ example");
MODULE_LICENSE("GPL");
MODULE_ALIAS("platform:myirq_driver");


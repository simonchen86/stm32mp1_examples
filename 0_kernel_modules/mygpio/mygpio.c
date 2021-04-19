/*******************************************************************
 *
 * Device tree settting:
 *     mygpio_device {
 *         compatible = "st,mygpio";
 *         status = "okay";
 *         greenled-gpios = <&gpioa 14 0>;
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

#define USING_API

struct gpio_desc *red, *green;

void __iomem * gpio_banka_base;
#define GPIO_BANKA_BASE		0X50002000
#define GPIO_MODER_OFFSET	0x00
#define GPIO_TYPER_OFFSET	0x04
#define GPIO_SPEEDR_OFFSET	0x08
#define GPIO_PUPDR_OFFSET	0x0c
#define GPIO_IDR_OFFSET		0x10
#define GPIO_ODR_OFFSET		0x14
#define GPIO_BSRR_OFFSET	0x18
#define GPIO_LCKR_OFFSET	0x1c
#define GPIO_AFRL_OFFSET	0x20
#define GPIO_AFRH_OFFSET	0x24

void __iomem * rcc_base;
#define RCC_BASE	0x50000000
#define RCC_MP_AHB4ENSETR	0xA28
#define RCC_MP_AHB4ENCLRR	0xA2C

static void mygpio_init(void)
{
	gpio_banka_base = ioremap(GPIO_BANKA_BASE, 0x3ff);
	rcc_base = ioremap(RCC_BASE, 0xfff);

	//Enable GPIOA clk
	writel_relaxed(1 << 0, rcc_base + RCC_MP_AHB4ENSETR);

	printk("RCC_MP_AHB4ENSETR: 0x%x\n", readl_relaxed(rcc_base + GPIO_MODER_OFFSET));

	writel_relaxed(1 << 28, gpio_banka_base + GPIO_MODER_OFFSET); //PA14 Output
	writel_relaxed(1 << 28, gpio_banka_base + GPIO_SPEEDR_OFFSET); //PA14 Medium speed

	printk("GPIOA MODER: 0x%x\n", readl_relaxed(gpio_banka_base + GPIO_MODER_OFFSET));
	printk("GPIOA SPPEEDR: 0x%x\n", readl_relaxed(gpio_banka_base + GPIO_SPEEDR_OFFSET));
}

static void mygpio_set_value(int value)
{
	if (value)
		writel_relaxed(1 << 14, gpio_banka_base + GPIO_BSRR_OFFSET); //PA14 set
	else
		writel_relaxed(1 << 30, gpio_banka_base + GPIO_BSRR_OFFSET); //PA14 clear

	//writel_relaxed(value << 14, gpio_banka_base + GPIO_ODR_OFFSET); //PA14 output value
}

static int gpio_init_probe(struct platform_device *pdev)
{
	int i = 0;

	printk("GPIO example init\n");

#ifdef USING_API
	green = devm_gpiod_get(&pdev->dev, "greenled", GPIOD_OUT_LOW);
#else
	mygpio_init();
#endif

	while(i < 100)
	{
	#ifdef USING_API //using gpio consumer interface
		udelay(1);
		gpiod_set_value(green, 1);

		udelay(1);
		gpiod_set_value(green, 0);
	#else
		udelay(1);
		mygpio_set_value(1);

		udelay(1);
		mygpio_set_value(0);

	#endif

		i = 0;
	}

	return 0;
}

static int gpio_exit_remove(struct platform_device * pdev)
{
	printk("GPIO example exit\n");

	return 0;
}

static struct of_device_id mygpio_match[] = {
	{.compatible = "st,mygpio"},
	{/* end node */}
};

static struct platform_driver mygpio_driver = {
	.probe = gpio_init_probe,
	.remove = gpio_exit_remove,
	.driver = {
		.name = "mygpio_driver",
		.owner = THIS_MODULE,
		.of_match_table = mygpio_match,
	}
};

module_platform_driver(mygpio_driver);

MODULE_AUTHOR("Simon Chen");
MODULE_DESCRIPTION("GPIO example");
MODULE_LICENSE("GPL");
MODULE_ALIAS("platform:mygpio_driver");


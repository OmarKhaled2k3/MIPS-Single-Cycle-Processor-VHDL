/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/vboxuser/Desktop/OmarKhaled_222000009_2024/OmarKhaled_222000009_2024/sign_extend.vhd";



static void work_a_0909257147_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(31, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 3016);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_delta(t1, 16U, 16U, 0LL);

LAB2:    t7 = (t0 + 2920);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0909257147_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    unsigned int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(32, ng0);

LAB3:    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t5 = (15 - 15);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t3 = (t4 + t8);
    t9 = *((unsigned char *)t3);
    if (-1 == -1)
        goto LAB5;

LAB6:    t10 = 16;

LAB7:    t11 = (t10 - 31);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (t2 + t13);
    t15 = (16 - 31);
    t16 = (t15 * -1);
    t16 = (t16 + 1);
    t17 = (1U * t16);
    memset(t14, t9, t17);
    t18 = (t0 + 3080);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 16U);
    xsi_driver_first_trans_delta(t18, 0U, 16U, 0LL);

LAB2:    t23 = (t0 + 2936);
    *((int *)t23) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    t10 = 31;
    goto LAB7;

}


extern void work_a_0909257147_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0909257147_3212880686_p_0,(void *)work_a_0909257147_3212880686_p_1};
	xsi_register_didat("work_a_0909257147_3212880686", "isim/MIPS_Test_isim_beh.exe.sim/work/a_0909257147_3212880686.didat");
	xsi_register_executes(pe);
}

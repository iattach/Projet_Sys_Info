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

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/yu_yang/Bureau/git_em/Projet_Sys_Info/processeur/BankRegistre.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_5109402382352621412_3965413181(char *, char *, char *);


static void work_a_1800163175_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    unsigned int t19;
    unsigned int t20;

LAB0:    t1 = (t0 + 3624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);

LAB6:    t2 = (t0 + 4440);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t6 = (t0 + 4440);
    *((int *)t6) = 0;
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t5 = (t3 == (unsigned char)2);
    if (t5 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t5 = (t3 == (unsigned char)3);
    if (t5 != 0)
        goto LAB16;

LAB18:
LAB17:
LAB12:    goto LAB2;

LAB5:    t4 = (t0 + 1952U);
    t5 = xsi_signal_has_event(t4);
    if (t5 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    t6 = (t0 + 1992U);
    t7 = *((char **)t6);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t3 = t9;
    goto LAB10;

LAB11:    xsi_set_current_line(56, ng0);
    t2 = xsi_get_transient_memory(2048U);
    memset(t2, 0, 2048U);
    t6 = t2;
    t7 = (t0 + 9639);
    t8 = (8U != 0);
    if (t8 == 1)
        goto LAB14;

LAB15:    t12 = (t0 + 4552);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 2048U);
    xsi_driver_first_trans_fast(t12);
    goto LAB12;

LAB14:    t11 = (2048U / 8U);
    xsi_mem_set_data(t6, t7, 8U, t11);
    goto LAB15;

LAB16:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t2 = (t0 + 1352U);
    t7 = *((char **)t2);
    t2 = (t0 + 7464U);
    t17 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t7, t2);
    t18 = (t17 - 0);
    t11 = (t18 * 1);
    t19 = (8U * t11);
    t20 = (0U + t19);
    t10 = (t0 + 4552);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 8U);
    xsi_driver_first_trans_delta(t10, t20, 8U, 0LL);
    goto LAB17;

}

static void work_a_1800163175_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;

LAB0:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t24 = (t0 + 2472U);
    t25 = *((char **)t24);
    t24 = (t0 + 1032U);
    t26 = *((char **)t24);
    t24 = (t0 + 7432U);
    t27 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t26, t24);
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t27);
    t30 = (8U * t29);
    t31 = (0 + t30);
    t32 = (t25 + t31);
    t33 = (t0 + 4616);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t32, 8U);
    xsi_driver_first_trans_fast_port(t33);

LAB2:    t38 = (t0 + 4456);
    *((int *)t38) = 1;

LAB1:    return;
LAB3:    t10 = (t0 + 2472U);
    t11 = *((char **)t10);
    t10 = (t0 + 1352U);
    t12 = *((char **)t10);
    t10 = (t0 + 7464U);
    t13 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t12, t10);
    t14 = (t13 - 0);
    t15 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t13);
    t16 = (8U * t15);
    t17 = (0 + t16);
    t18 = (t11 + t17);
    t19 = (t0 + 4616);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t18, 8U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB2;

LAB5:    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t2 = (t0 + 7464U);
    t7 = (t0 + 1032U);
    t8 = *((char **)t7);
    t7 = (t0 + 7432U);
    t9 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t6, t2, t8, t7);
    t1 = t9;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_1800163175_3212880686_p_2(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;

LAB0:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t24 = (t0 + 2472U);
    t25 = *((char **)t24);
    t24 = (t0 + 1192U);
    t26 = *((char **)t24);
    t24 = (t0 + 7448U);
    t27 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t26, t24);
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t27);
    t30 = (8U * t29);
    t31 = (0 + t30);
    t32 = (t25 + t31);
    t33 = (t0 + 4680);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t32, 8U);
    xsi_driver_first_trans_fast_port(t33);

LAB2:    t38 = (t0 + 4472);
    *((int *)t38) = 1;

LAB1:    return;
LAB3:    t10 = (t0 + 2472U);
    t11 = *((char **)t10);
    t10 = (t0 + 1192U);
    t12 = *((char **)t10);
    t10 = (t0 + 7448U);
    t13 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t12, t10);
    t14 = (t13 - 0);
    t15 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t13);
    t16 = (8U * t15);
    t17 = (0 + t16);
    t18 = (t11 + t17);
    t19 = (t0 + 4680);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t18, 8U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB2;

LAB5:    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t2 = (t0 + 7464U);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 7448U);
    t9 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t6, t2, t8, t7);
    t1 = t9;
    goto LAB7;

LAB9:    goto LAB2;

}


extern void work_a_1800163175_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1800163175_3212880686_p_0,(void *)work_a_1800163175_3212880686_p_1,(void *)work_a_1800163175_3212880686_p_2};
	xsi_register_didat("work_a_1800163175_3212880686", "isim/TestProc_isim_beh.exe.sim/work/a_1800163175_3212880686.didat");
	xsi_register_executes(pe);
}

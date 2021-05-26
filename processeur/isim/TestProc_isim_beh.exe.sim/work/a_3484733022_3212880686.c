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
static const char *ng0 = "/home/yu_yang/Bureau/git_em/Projet_Sys_Info/processeur/BancMemoInstruction.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_3484733022_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;

LAB0:    xsi_set_current_line(45, ng0);

LAB3:    t1 = xsi_get_transient_memory(8192U);
    memset(t1, 0, 8192U);
    t2 = t1;
    t3 = (t0 + 14162);
    t5 = (32U != 0);
    if (t5 == 1)
        goto LAB5;

LAB6:    t7 = (t0 + 14194);
    t9 = (0 - 0);
    t10 = (t9 * 1);
    t11 = (32U * t10);
    t12 = (t2 + t11);
    memcpy(t12, t7, 32U);
    t13 = (t0 + 14226);
    t15 = (5 - 0);
    t16 = (t15 * 1);
    t17 = (32U * t16);
    t18 = (t2 + t17);
    memcpy(t18, t13, 32U);
    t19 = (t0 + 14258);
    t21 = (6 - 0);
    t22 = (t21 * 1);
    t23 = (32U * t22);
    t24 = (t2 + t23);
    memcpy(t24, t19, 32U);
    t25 = (t0 + 14290);
    t27 = (7 - 0);
    t28 = (t27 * 1);
    t29 = (32U * t28);
    t30 = (t2 + t29);
    memcpy(t30, t25, 32U);
    t31 = (t0 + 14322);
    t33 = (12 - 0);
    t34 = (t33 * 1);
    t35 = (32U * t34);
    t36 = (t2 + t35);
    memcpy(t36, t31, 32U);
    t37 = (t0 + 14354);
    t39 = (17 - 0);
    t40 = (t39 * 1);
    t41 = (32U * t40);
    t42 = (t2 + t41);
    memcpy(t42, t37, 32U);
    t43 = (t0 + 14386);
    t45 = (22 - 0);
    t46 = (t45 * 1);
    t47 = (32U * t46);
    t48 = (t2 + t47);
    memcpy(t48, t43, 32U);
    t49 = (t0 + 3472);
    t50 = (t49 + 56U);
    t51 = *((char **)t50);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    memcpy(t53, t1, 8192U);
    xsi_driver_first_trans_fast(t49);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    t6 = (8192U / 32U);
    xsi_mem_set_data(t2, t3, 32U, t6);
    goto LAB6;

}

static void work_a_3484733022_3212880686_p_1(char *t0)
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
    char *t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;

LAB0:    t1 = (t0 + 3072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);

LAB6:    t2 = (t0 + 3392);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t6 = (t0 + 3392);
    *((int *)t6) = 0;
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t5 = *((unsigned char *)t4);
    t8 = (t5 == (unsigned char)3);
    if (t8 == 1)
        goto LAB14;

LAB15:    t3 = (unsigned char)0;

LAB16:    if (t3 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 1032U);
    t6 = *((char **)t2);
    t2 = (t0 + 5888U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t6, t2);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t14);
    t17 = (32U * t16);
    t18 = (0 + t17);
    t7 = (t4 + t18);
    t10 = (t0 + 3536);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t19 = *((char **)t13);
    memcpy(t19, t7, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB12:    goto LAB2;

LAB5:    t4 = (t0 + 1312U);
    t5 = xsi_signal_has_event(t4);
    if (t5 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    t6 = (t0 + 1352U);
    t7 = *((char **)t6);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t3 = t9;
    goto LAB10;

LAB11:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 14418);
    t7 = (t0 + 3536);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB12;

LAB14:    t3 = (unsigned char)0;
    goto LAB16;

}


extern void work_a_3484733022_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3484733022_3212880686_p_0,(void *)work_a_3484733022_3212880686_p_1};
	xsi_register_didat("work_a_3484733022_3212880686", "isim/TestProc_isim_beh.exe.sim/work/a_3484733022_3212880686.didat");
	xsi_register_executes(pe);
}

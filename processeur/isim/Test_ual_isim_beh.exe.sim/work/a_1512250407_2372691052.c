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
static const char *ng0 = "/home/yu_yang/Bureau/git_em/Projet_Sys_Info/processeur/Test_ual.vhd";



static void work_a_1512250407_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3584U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(92, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 10);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t5);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 6632);
    t6 = (t0 + 3968);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 6640);
    t6 = (t0 + 4032);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 6648);
    t6 = (t0 + 4096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 3U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 5);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t5);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 6651);
    t6 = (t0 + 3968);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 6659);
    t6 = (t0 + 4032);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 6667);
    t6 = (t0 + 4096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 3U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 5);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t5);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 6670);
    t6 = (t0 + 3968);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 6678);
    t6 = (t0 + 4032);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 6686);
    t6 = (t0 + 4096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 3U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 5);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t5);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(117, ng0);
    t2 = (t0 + 6689);
    t6 = (t0 + 3968);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 6697);
    t6 = (t0 + 4032);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 6705);
    t6 = (t0 + 4096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 3U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 5);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t5);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 6708);
    t6 = (t0 + 3968);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 6716);
    t6 = (t0 + 4032);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 6724);
    t6 = (t0 + 4096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 3U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 5);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t5);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 6727);
    t6 = (t0 + 3968);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 6735);
    t6 = (t0 + 4032);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 6743);
    t6 = (t0 + 4096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 3U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 2608U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 5);
    t2 = (t0 + 3392);
    xsi_process_wait(t2, t5);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(138, ng0);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    goto LAB2;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

}


extern void work_a_1512250407_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1512250407_2372691052_p_0};
	xsi_register_didat("work_a_1512250407_2372691052", "isim/Test_ual_isim_beh.exe.sim/work/a_1512250407_2372691052.didat");
	xsi_register_executes(pe);
}

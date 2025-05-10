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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_1843507802_3212880686_init();
    work_a_0944849203_3212880686_init();
    work_a_1991350011_3212880686_init();
    work_a_0611482308_3212880686_init();
    work_a_2096391741_3212880686_init();
    work_a_3372074491_3212880686_init();
    work_a_1350853198_3212880686_init();
    work_a_1901108640_3212880686_init();
    work_a_0909257147_3212880686_init();
    work_a_0679639603_3212880686_init();
    work_a_0337583742_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_3347309923_3212880686_init();
    work_a_1430113433_3212880686_init();
    work_a_3968679286_2372691052_init();


    xsi_register_tops("work_a_3968679286_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");

    return xsi_run_simulation(argc, argv);

}

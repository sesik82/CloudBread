﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Microsoft.WindowsAzure.Mobile.Service;

using System.Threading.Tasks;
using System.Diagnostics;
using Logger.Logging;
using CloudBread.globals;
using CloudBreadLib.BAL.Crypto;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace CloudBread.Controllers
{
    public class CBAddUseMemberItemController : ApiController
    {
        public ApiServices Services { get; set; }

        public class InputParams
        {
            public string InsertORUpdateORDelete;
            public string MemberItemID_MemberItem;
            public string MemberID_MemberItem;
            public string ItemListID_MemberItem;
            public string ItemCount_MemberItem;
            public string ItemStatus_MemberItem;
            public string sCol1_MemberItem;
            public string sCol2_MemberItem;
            public string sCol3_MemberItem;
            public string sCol4_MemberItem;
            public string sCol5_MemberItem;
            public string sCol6_MemberItem;
            public string sCol7_MemberItem;
            public string sCol8_MemberItem;
            public string sCol9_MemberItem;
            public string sCol10_MemberItem;
            public string MemberID_MemberGameInfoes;
            public string Level_MemberGameInfoes;
            public string Exps_MemberGameInfoes;
            public string Points_MemberGameInfoes;
            public string UserSTAT1_MemberGameInfoes;
            public string UserSTAT2_MemberGameInfoes;
            public string UserSTAT3_MemberGameInfoes;
            public string UserSTAT4_MemberGameInfoes;
            public string UserSTAT5_MemberGameInfoes;
            public string UserSTAT6_MemberGameInfoes;
            public string UserSTAT7_MemberGameInfoes;
            public string UserSTAT8_MemberGameInfoes;
            public string UserSTAT9_MemberGameInfoes;
            public string UserSTAT10_MemberGameInfoes;
            public string sCol1_MemberGameInfoes;
            public string sCol2_MemberGameInfoes;
            public string sCol3_MemberGameInfoes;
            public string sCol4_MemberGameInfoes;
            public string sCol5_MemberGameInfoes;
            public string sCol6_MemberGameInfoes;
            public string sCol7_MemberGameInfoes;
            public string sCol8_MemberGameInfoes;
            public string sCol9_MemberGameInfoes;
            public string sCol10_MemberGameInfoes;
        }

        
        public string Post(InputParams p)
        {

            string result = "";
            ////////////////////////////////////////////////////////////////////////
            //보유 아이템 추가-사용 컨트롤러 시작
            ////////////////////////////////////////////////////////////////////////
            Logging.CBLoggers logMessage = new Logging.CBLoggers();
            string jsonParam = JsonConvert.SerializeObject(p);

            try
            {
                // 진입로그
                //logMessage.memberID = p.MemberID_MemberItem;
                //logMessage.Level = "INFO";
                //logMessage.Logger = "CBAddUseMemberItemController";
                //logMessage.Message = jsonParam;
                //Logging.RunLog(logMessage);

                using (SqlConnection connection = new SqlConnection(globalVal.DBConnectionString))
                {
                    using (SqlCommand command = new SqlCommand("CloudBread.uspAddUseMemberItem", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@InsertORUpdateORDelete", SqlDbType.NVarChar, -1).Value = p.InsertORUpdateORDelete.ToUpper();
                        command.Parameters.Add("@MemberItemID_MemberItem", SqlDbType.NVarChar, -1).Value = p.MemberItemID_MemberItem;
                        command.Parameters.Add("@MemberID_MemberItem", SqlDbType.NVarChar, -1).Value = p.MemberID_MemberItem;
                        command.Parameters.Add("@ItemListID_MemberItem", SqlDbType.NVarChar, -1).Value = p.ItemListID_MemberItem;
                        command.Parameters.Add("@ItemCount_MemberItem", SqlDbType.NVarChar, -1).Value = p.ItemCount_MemberItem;
                        command.Parameters.Add("@ItemStatus_MemberItem", SqlDbType.NVarChar, -1).Value = p.ItemStatus_MemberItem;
                        command.Parameters.Add("@sCol1_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol1_MemberItem;
                        command.Parameters.Add("@sCol2_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol2_MemberItem;
                        command.Parameters.Add("@sCol3_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol3_MemberItem;
                        command.Parameters.Add("@sCol4_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol4_MemberItem;
                        command.Parameters.Add("@sCol5_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol5_MemberItem;
                        command.Parameters.Add("@sCol6_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol6_MemberItem;
                        command.Parameters.Add("@sCol7_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol7_MemberItem;
                        command.Parameters.Add("@sCol8_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol8_MemberItem;
                        command.Parameters.Add("@sCol9_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol9_MemberItem;
                        command.Parameters.Add("@sCol10_MemberItem", SqlDbType.NVarChar, -1).Value = p.sCol10_MemberItem;
                        command.Parameters.Add("@MemberID_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.MemberID_MemberGameInfoes;
                        command.Parameters.Add("@Level_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.Level_MemberGameInfoes;
                        command.Parameters.Add("@Exps_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.Exps_MemberGameInfoes;
                        command.Parameters.Add("@Points_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.Points_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT1_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT1_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT2_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT2_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT3_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT3_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT4_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT4_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT5_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT5_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT6_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT6_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT7_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT7_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT8_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT8_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT9_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT9_MemberGameInfoes;
                        command.Parameters.Add("@UserSTAT10_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.UserSTAT10_MemberGameInfoes;
                        command.Parameters.Add("@sCol1_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol1_MemberGameInfoes;
                        command.Parameters.Add("@sCol2_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol2_MemberGameInfoes;
                        command.Parameters.Add("@sCol3_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol3_MemberGameInfoes;
                        command.Parameters.Add("@sCol4_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol4_MemberGameInfoes;
                        command.Parameters.Add("@sCol5_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol5_MemberGameInfoes;
                        command.Parameters.Add("@sCol6_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol6_MemberGameInfoes;
                        command.Parameters.Add("@sCol7_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol7_MemberGameInfoes;
                        command.Parameters.Add("@sCol8_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol8_MemberGameInfoes;
                        command.Parameters.Add("@sCol9_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol9_MemberGameInfoes;
                        command.Parameters.Add("@sCol10_MemberGameInfoes", SqlDbType.NVarChar, -1).Value = p.sCol10_MemberGameInfoes;


                        connection.Open();
                        using (SqlDataReader dreader = command.ExecuteReader())
                        {
                            while (dreader.Read())
                            {
                                result = dreader[0].ToString();
                            }
                            dreader.Close();
                        }
                        connection.Close();

                        //완료 로그
                        logMessage.memberID = p.MemberID_MemberItem;
                        logMessage.Level = "INFO";
                        logMessage.Logger = "CBAddUseMemberItemController";
                        logMessage.Message = jsonParam;
                        Logging.RunLog(logMessage);

                        return result;
                    }

                }
            }

            catch (Exception ex)
            {
                //에러로그
                logMessage.memberID = p.MemberID_MemberItem;
                logMessage.Level = "ERROR";
                logMessage.Logger = "CBAddUseMemberItemController";
                logMessage.Message = jsonParam;
                logMessage.Exception = ex.ToString();
                Logging.RunLog(logMessage);

                throw;
            }
        }

    }
}

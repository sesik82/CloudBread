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
    public class CBComUdtItemList1Controller : ApiController
    {
        public ApiServices Services { get; set; }

        public class InputParams
        {
            public string MemberID { get; set; }     // 로그 식별
            public string ItemListID { get; set; }
            public string ItemName { get; set; }
            public string ItemDescription { get; set; }
            public string ItemPrice { get; set; }
            public string ItemSellPrice { get; set; }
            public string ItemCategory1 { get; set; }
            public string ItemCategory2 { get; set; }
            public string ItemCategory3 { get; set; }
            public string sCol1 { get; set; }
            public string sCol2 { get; set; }
            public string sCol3 { get; set; }
            public string sCol4 { get; set; }
            public string sCol5 { get; set; }
            public string sCol6 { get; set; }
            public string sCol7 { get; set; }
            public string sCol8 { get; set; }
            public string sCol9 { get; set; }
            public string sCol10 { get; set; }

        }

        public string Post(InputParams p)
        {
            string result = "";
            ////////////////////////////////////////////////////////////////////////
            // 공통 회원아이템 정보 수정 모듈 시작 update시 파라미터를 NULL로 주면 해당 컬럼은 변화되지 않음.
            // Json에서는 null 으로 값을 지정하거나 아예 로우 값을 제공하지 않아도 가능
            ////////////////////////////////////////////////////////////////////////
            Logging.CBLoggers logMessage = new Logging.CBLoggers();
            string jsonParam = JsonConvert.SerializeObject(p);

            try
            {
                // 진입로그
                //logMessage.memberID = p.MemberID;
                //logMessage.Level = "INFO";
                //logMessage.Logger = "CBComUdtItemList1Controller";
                //logMessage.Message = jsonParam;
                //Logging.RunLog(logMessage);

                using (SqlConnection connection = new SqlConnection(globalVal.DBConnectionString))
                {
                    using (SqlCommand command = new SqlCommand("CloudBread.uspComUdtItemList1", connection))
                    {

                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@ItemListID ", SqlDbType.NVarChar, -1).Value = p.ItemListID;
                        command.Parameters.Add("@ItemName ", SqlDbType.NVarChar, -1).Value = p.ItemName;
                        command.Parameters.Add("@ItemDescription ", SqlDbType.NVarChar, -1).Value = p.ItemDescription;
                        command.Parameters.Add("@ItemPrice ", SqlDbType.NVarChar, -1).Value = p.ItemPrice;
                        command.Parameters.Add("@ItemSellPrice ", SqlDbType.NVarChar, -1).Value = p.ItemSellPrice;
                        command.Parameters.Add("@ItemCategory1 ", SqlDbType.NVarChar, -1).Value = p.ItemCategory1;
                        command.Parameters.Add("@ItemCategory2 ", SqlDbType.NVarChar, -1).Value = p.ItemCategory2;
                        command.Parameters.Add("@ItemCategory3 ", SqlDbType.NVarChar, -1).Value = p.ItemCategory3;
                        command.Parameters.Add("@sCol1 ", SqlDbType.NVarChar, -1).Value = p.sCol1;
                        command.Parameters.Add("@sCol2 ", SqlDbType.NVarChar, -1).Value = p.sCol2;
                        command.Parameters.Add("@sCol3 ", SqlDbType.NVarChar, -1).Value = p.sCol3;
                        command.Parameters.Add("@sCol4 ", SqlDbType.NVarChar, -1).Value = p.sCol4;
                        command.Parameters.Add("@sCol5 ", SqlDbType.NVarChar, -1).Value = p.sCol5;
                        command.Parameters.Add("@sCol6 ", SqlDbType.NVarChar, -1).Value = p.sCol6;
                        command.Parameters.Add("@sCol7 ", SqlDbType.NVarChar, -1).Value = p.sCol7;
                        command.Parameters.Add("@sCol8 ", SqlDbType.NVarChar, -1).Value = p.sCol8;
                        command.Parameters.Add("@sCol9 ", SqlDbType.NVarChar, -1).Value = p.sCol9;
                        command.Parameters.Add("@sCol10 ", SqlDbType.NVarChar, -1).Value = p.sCol10;

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

                        // 완료 로그
                        logMessage.memberID = p.MemberID;
                        logMessage.Level = "INFO";
                        logMessage.Logger = "CBComUdtItemList1Controller";
                        logMessage.Message = jsonParam;
                        Logging.RunLog(logMessage);

                        return result;
                    }

                }
            }

            catch (Exception ex)
            {
                //에러로그
                logMessage.memberID = p.MemberID;
                logMessage.Level = "ERROR";
                logMessage.Logger = "CBComUdtItemList1Controller";
                logMessage.Message = jsonParam;
                logMessage.Exception = ex.ToString();
                Logging.RunLog(logMessage);

                throw;
            }
        }

    }
}

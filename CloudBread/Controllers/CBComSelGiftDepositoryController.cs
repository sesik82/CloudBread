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
    public class CBComSelGiftDepositoryController : ApiController
    {
        public ApiServices Services { get; set; }

        public class InputParams {
            public string MemberID;     // 로그 식별
            public string GiftDepositoryID;
        }

        public class Model
        {
            public string GiftDepositoryID { get; set; }
            public string ItemListID { get; set; }
            public string ItemCount { get; set; }
            public string FromMemberID { get; set; }
            public string ToMemberID { get; set; }
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

        public List<Model> Post(InputParams p)
        {
            Logging.CBLoggers logMessage = new Logging.CBLoggers();
            string jsonParam = JsonConvert.SerializeObject(p);

            List<Model> result = new List<Model>();

            try
            {

                using (SqlConnection connection = new SqlConnection(globalVal.DBConnectionString))
                {
                    using (SqlCommand command = new SqlCommand("CloudBread.uspComSelGiftDepository", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@GiftDepositoryID", SqlDbType.NVarChar, -1).Value = p.GiftDepositoryID;
                        connection.Open();

                        using (SqlDataReader dreader = command.ExecuteReader())
                        {
                            while (dreader.Read())
                            {
                                Model workItem = new Model()
                                {
                                    GiftDepositoryID = dreader[0].ToString(),
                                    ItemListID = dreader[1].ToString(),
                                    ItemCount = dreader[2].ToString(),
                                    FromMemberID = dreader[3].ToString(),
                                    ToMemberID = dreader[4].ToString(),
                                    sCol2 = dreader[5].ToString(),
                                    sCol3 = dreader[6].ToString(),
                                    sCol4 = dreader[7].ToString(),
                                    sCol5 = dreader[8].ToString(),
                                    sCol6 = dreader[9].ToString(),
                                    sCol7 = dreader[10].ToString(),
                                    sCol8 = dreader[11].ToString(),
                                    sCol9 = dreader[12].ToString(),
                                    sCol10 = dreader[13].ToString()

                                };
                                result.Add(workItem);
                            }
                            dreader.Close();
                        }
                        connection.Close();
                    }
                    return result;
                }
            }

            catch (Exception ex)
            {
                //에러로그
                logMessage.memberID = p.MemberID;
                logMessage.Level = "ERROR";
                logMessage.Logger = "CBComSelGiftDepositoryController";
                logMessage.Message = jsonParam;
                logMessage.Exception = ex.ToString();
                Logging.RunLog(logMessage);

                throw;
            }
        }

    }
}

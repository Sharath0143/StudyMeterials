
                con = new OracleConnection(conStr);
                cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT USER_ID,USER_CODE,USE_PWD FROM SYUSER_ERP WHERE jniis_user_id = '" + UserId+"'";
                cmd.CommandType = CommandType.Text;

                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                    con.Dispose();
                }
                con.Open();
                da = new OracleDataAdapter(cmd);
                DataTable Schedule = new DataTable();
                da.Fill(Schedule);
                User user = ConvertToERPUser(Schedule).FirstOrDefault();

database "do_backup" do
  provider "database"
  
  mount_point node[:db_mysql][:datadir_relocate]
  block_device_type node[:db_mysql][:backup][:storage_type]
  
  # Database settings
  host = node[:db_mysql][:fqdn]  
  user = node[:db_mysql][:admin_user]
  password = node[:db_mysql][:admin_password] 

  # Backup/Restore arguments
  lineage node[:db_mysql][:backup][:lineage]  
  max_snapshots node[:db_mysql][:backup][:max_snapshots]
  keep_daily node[:db_mysql][:backup][:keep_daily]
  keep_weekly node[:db_mysql][:backup][:keep_weekly]
  keep_monthly node[:db_mysql][:backup][:keep_monthly]
  keep_yearly node[:db_mysql][:backup][:keep_yearly]
  
  # Remote Object Storage account info (S3, CloudFiles)
  storage_account_id node[:db_mysql][:backup][:storage_account_id]
  storage_account_secret node[:db_mysql][:backup][:storage_account_secret]
  storage_container node[:db_mysql][:backup][:storage_container]
    
  action :backup
end
{
  cloudflared = {
    image = "cloudflare/cloudflared:latest";
    autoStart = true;
    cmd = [ 
      "tunnel" 
      "--no-autoupdate" 
      "run" 
      "--token" 
      "eyJhIjoiZDBkOTJiOWVmM2NhZDlhZDMyYWE5YTcxNmNiYWJjM2QiLCJ0IjoiNGE2OWIyMjQtY2JlZi00ZjRjLTkxMDMtNzc3YjA3NDdmNTQ3IiwicyI6IlpqUTFZbVkzWkdFdFpUTTJOaTAwWWpneUxXSmlORGN0T0RFeVkySTNOemRoWkRZeiJ9"
    ];
    extraOptions = [
      "--network=host"  # Allows access to localhost:9443
    ];
  };
}

Table gameData;

/*
** check data file when enter the game
** if there is no data file, create a new one
** if there is a data file, load this file
*/
void checkData() {
  //if data file exists, load game data
  if (file.exists()) loadData();
  //if no game data, create a new data file
  else saveData();
}

/*
** create a new data file and save it
*/
void saveData() {
  gameData = new Table();
  gameData.addColumn("password");
  //gameData.addColumn("playerLvl");
  //gameData.addColumn("playerExp");
  //gameData.addColumn("coinAmount");
  gameData.addRow();
  gameData.setString(0, "password", gameUI.passwordCurrent);
  //gameData.setInt(0, "playerLvl", gameUI.playerLvl);
  //gameData.setFloat(0, "playerExp", gameUI.playerExp);
  //gameData.setInt(0, "coinAmount", gameUI.coinAmount);
  saveTable(gameData, "data/gameData.csv");
}

/*
** load data file
*/
void loadData() {
  gameData = loadTable("gameData.csv", "header");
  gameUI.passwordCurrent = gameData.getString(0,"password");
  //gameUI.playerLvl = gameData.getInt(0,"playerLvl");
  //gameUI.playerExp = gameData.getFloat(0,"playerExp");
  //gameUI.coinAmount = gameData.getInt(0,"coinAmount");
}

package agile.games;

import io.cucumber.java.en.And;

import static agile.games.GameStepUtilities.getGameSession;

public class BotPlayersSteps {

    @And("a bot player named {string}")
    public void aBotNamed(String name) {
        getGameSession().addBotPlayerNamed(name, getGameSession().newUser());
    }
}


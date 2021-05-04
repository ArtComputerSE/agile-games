package agile.games.tts;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BotPlayer extends Player {
    private static final Logger LOG = LoggerFactory.getLogger(BotPlayer.class);

    public BotPlayer(String name, int x, int y, Board board, String avatar) {
        super(name, x, y, board, avatar);
        setState(PlayerState.ESTIMATION_COMPLETED);
    }
}


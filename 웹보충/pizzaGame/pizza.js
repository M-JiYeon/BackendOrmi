class Pizza {
    constructor() {
        this.pos = new Tile(10, 20);
    }

    renderPizza() {
        this.pos.renderImg();
    }

    movePizza() {
        // Math.random() : 0 ~ 0.9999... 랜덤한 실수를 반환합니다.
        // Math.random() * 10 ==> 0 ~ 9.999...
        const col = Math.floor(Math.random() * (tileWidth - 2)) + 1;
        const row = Math.floor(Math.random() * (tileHeight - 2)) + 1;

        this.pos = new Tile(col, row);
    }
}

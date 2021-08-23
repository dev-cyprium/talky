import Alpine from "alpinejs";

Alpine.data("botInterface", () => ({
  drawerOpen: null,
  firstClick: false,
  handleClick(ev) {
    this.firstClick = true;
    this.openDrawer(
      ev.clientY - ev.target.getBoundingClientRect().top,
      ev.clientX - ev.target.getBoundingClientRect().left
    );
  },
  openDrawer(top, left) {
    if (!!this.drawerOpen) return;

    this.drawerOpen = {
      left,
      top,
    };
  },
}));

export default {
  mounted() {},
};

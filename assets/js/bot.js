import { Socket } from "phoenix";

window.Bot = {
  globalStyles(config) {
    const styles = document.createElement("style");
    const ref = document.querySelector("script");

    styles.innerHTML = `
      #chat-bot-wrap {
        font-family: ${config.fontFamily}
      }

      #chat-window {
        display: none;
        position: fixed;
        bottom: ${config.offset};
        right: ${config.offset};
        height: 28rem;
        border: 1px solid #aaa;
      }

      #chat-window h3 {
        padding: 0.5rem 0.3rem;
        color: white;
        margin: 0;
        background: rgb(68,114,202);
        background: linear-gradient(90deg, #34D399 0%, #3B82F6 100%);
      }

      #chat-button {
        background: #4472CA;
        outline: none;
        border: none;
        position: fixed;
        bottom: ${config.offset};
        right: ${config.offset};
        color: white;
        border-radius: 100%;
        padding: 1rem;
        cursor: pointer;
      }

      #chat-button > svg {
        width: 2rem;
        height: 2rem;
      }
      
      .chat-area {
        padding: 1rem;
        disply: flex;
      }
    `;

    ref.parentNode.insertBefore(styles, ref);
  },
  setStyle(el, styles) {
    if (NodeList.prototype.isPrototypeOf(el)) {
      return [...el].forEach((e) => this.setStyle(e, styles));
    }

    Object.keys(styles).forEach((style) => {
      el.style[style] = styles[style];
    });
  },
  html() {
    return `
      <div id="chat-bot-wrap">
        <button id="chat-button">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8h2a2 2 0 012 2v6a2 2 0 01-2 2h-2v4l-4-4H9a1.994 1.994 0 01-1.414-.586m0 0L11 14h4a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2v4l.586-.586z" />
          </svg>
        </button>
        <div id="chat-window">
          <div class='header'>
            <h3>Live Support</h3>
          </div>
          <div class="chat-area">
            <input id="username" type='text' placeholder="Username..." />
          </div>
        </div>
      </div>
    `;
  },
  init(selector, config) {
    this.globalStyles(config);

    const node = document.querySelector(selector);

    if (!node) throw new Error(`DOM Error: ${selector} not found in DOM!`);

    const wrapper = document.createElement("div");
    wrapper.innerHTML = this.html();
    node.appendChild(wrapper);

    const chatButton = wrapper.querySelector("#chat-button");
    const chatWindow = wrapper.querySelector("#chat-window");
    const username = wrapper.querySelector("#username");

    chatButton.addEventListener("click", () => {
      this.setStyle(chatButton, { display: "none" });
      this.setStyle(chatWindow, { display: "block" });
    });

    username.addEventListener("keyup", (ev) => {
      if (ev.keyCode === 13) {
        this.connect(username.value);
      }
    });
  },
  connect(username) {
    const socket = new Socket("ws://localhost:4000/socket", {
      params: { username },
    });
    socket.connect();
  },
};

Bot.init(
  window.BOT_MOUNT_NODE || "body",
  window.BOT_CONFIG || {
    offset: "8px",
    fontFamily: window.BOT_FONT,
  }
);

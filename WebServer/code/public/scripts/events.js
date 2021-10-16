let events = {};
export function onEvent(name, fn) {
    if (!events[name]) events[name] = [];
    events[name].push(fn);
}
export function transmitEvent(name, ...args) {
    events[name].forEach(fn => {
        fn(...args);
    });
}
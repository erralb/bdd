declare module 'sql.js' {
    // Add specific type declarations here if you know them
    const initSqlJs: any;
    export default initSqlJs;
}

declare module '@codemirror/view' {
    const EditorView: any;
    const keymap: any;
    const lineNumbers: any;
}

declare module '@codemirror/commands' {
    const defaultKeymap: any;
}

declare module '@codemirror/language' {
    const language: any;
}

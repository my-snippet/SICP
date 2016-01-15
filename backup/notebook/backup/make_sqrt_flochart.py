import graphviz as gv

styles_rect = {
    'graph': {
    },
    'nodes': {
        'fontname': 'Helvetica',
        'shape': 'rect',
    },
    'edges': {
    }
}
styles_diamond = {
    'graph': {
    },
    'nodes': {
        'fontname': 'Helvetica',
        'shape': 'diamond',
    },
    'edges': {
    }
}
styles_eclipse = {
    'graph': {
    },
    'nodes': {
        'fontname': 'Helvetica',
        'shape': 'eclipse',
    },
    'edges': {
    }
}


g_enough = gv.Digraph(format='jpg')
g_improve = gv.Digraph(format='jpg')
g_guess = gv.Digraph(format='jpg')

g_enough = apply_styles(g_enough, styles_diamond)
g_enough.node('enough?')

g_improve = apply_styles(g_improve, styles_rect)
g_improve.node('improve')

g_guess = apply_styles(g_guess, styles_eclipse)
g_guess.node('guess')

g_enough.subgraph(g_improve)
g_enough.subgraph(g_guess)
g_enough.edge('enough?', 'improve', label = 'No')
g_enough.edge('enough?', 'guess', label = 'Yes')
g_enough.render('img/sqrt-flowchart')


def apply_styles(graph, styles):
    graph.graph_attr.update(
        ('graph' in styles and styles['graph']) or {}
    )
    graph.node_attr.update(
        ('nodes' in styles and styles['nodes']) or {}
    )
    graph.edge_attr.update(
        ('edges' in styles and styles['edges']) or {}
    )
    return graph
